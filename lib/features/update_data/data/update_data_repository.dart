import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:odyssey_mobile/app/injectable.dart';
import 'package:odyssey_mobile/core/data/api/api_error_handler.dart';
import 'package:odyssey_mobile/core/data/api/api_service.dart';
import 'package:odyssey_mobile/core/data/api/models/info.dart';
import 'package:odyssey_mobile/core/data/api/models/info_category.dart';
import 'package:odyssey_mobile/core/data/api/models/performance.dart';
import 'package:odyssey_mobile/core/data/api/models/sponsor.dart';
import 'package:odyssey_mobile/core/data/api/models/stage.dart';
import 'package:odyssey_mobile/core/data/db/hive/hive_service.dart';
import 'package:odyssey_mobile/core/data/failures.dart';
import 'package:odyssey_mobile/core/data/services/logger_service.dart';
import 'package:odyssey_mobile/core/data/services/package_info_service.dart';
import 'package:odyssey_mobile/core/data/services/store_service.dart';
import 'package:odyssey_mobile/core/typedefs.dart';
import 'package:retrofit/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum AppUpdateStatus { required, recommended, upToDate }

// TODO: Consider API changes to reduce number of small requests.
class UpdateDataRepository {
  UpdateDataRepository({
    required ApiService apiService,
    required HiveDbService dbService,
    required SharedPreferences sharedPreferences,
    required PackageInfoService packageInfoService,
    required StoreService storeService,
  })  : _apiService = apiService,
        _dbService = dbService,
        _sharedPreferences = sharedPreferences,
        _packageInfoService = packageInfoService,
        _storeService = storeService;

  final ApiService _apiService;
  final SharedPreferences _sharedPreferences;
  final HiveDbService _dbService;
  final PackageInfoService _packageInfoService;
  final StoreService _storeService;

  static const _keyDataVersion = 'version';
  static const _keyLastSuccessfulUpdate = 'lastUpdate';
  static const _updateSnooze = Duration(hours: 12);

  bool shouldCheckForUpdates() {
    final lastUpdate = _sharedPreferences.getInt(_keyLastSuccessfulUpdate);

    return !isOfflineModeAvailable ||
        lastUpdate == null ||
        DateTime.now().isAfter(DateTime.fromMillisecondsSinceEpoch(lastUpdate).add(_updateSnooze));
  }

  AsyncResult<AppUpdateStatus> checkAppAPICompatibility() async {
    try {
      final currentVersion = await _packageInfoService.getPackageInfo().then((v) => v.version);

      final isIncompatibleFuture = _apiService.getShouldUpdate(currentVersion);
      final storeFuture = _storeService.checkForUpdates();

      final results = await Future.wait([isIncompatibleFuture, storeFuture], eagerError: false);

      final isIncompatible = (results[0] as HttpResponse<bool>).data;
      final storeData = results[1] as StoreData;

      final canUpdate =
          _storeService.canUpdate(version: currentVersion, versionStore: storeData.storeVersion);

      if (!isIncompatible) {
        if (canUpdate) {
          return right(AppUpdateStatus.recommended);
        }
        return right(AppUpdateStatus.upToDate);
      }
      // isIncompatible &&
      if (canUpdate) {
        return right(AppUpdateStatus.required);
      }

      // isIncompatible && !canUpdate
      sl.maybeGet<LoggerService>()?.logError(
          'Critical app update error',
          {
            'storeVersion': storeData.storeVersion,
            'currentVersion': currentVersion,
            'isIncompatible': isIncompatible,
          },
          StackTrace.current);
      return left(UpdateImpossibleFailure());
    } on DioException catch (e, s) {
      return left(dioErrorHandler(e, s));
    } catch (e, s) {
      return left(unknownErrorHandler(e, s));
    }
  }

  bool get isOfflineModeAvailable => _dbService.validateDatabase();

  AsyncResult<({bool updateAvailable, int version})> isDataUpdateAvailable() async {
    try {
      final remoteVersion = await _apiService.getVersion().then((value) => value.version);
      final localVersion = _sharedPreferences.getInt(_keyDataVersion) ?? -1;
      return right((updateAvailable: remoteVersion > localVersion, version: remoteVersion));
    } on DioException catch (e, s) {
      return left(dioErrorHandler(e, s));
    } catch (e, s) {
      return left(unknownErrorHandler(e, s));
    }
  }

  AsyncVoidResult updateData({required int newVersion, bool keepFavsOnUpdate = true}) async {
    try {
      List<int> previousFavIds = [];
      if (keepFavsOnUpdate) {
        previousFavIds = await _dbService.readFavIds();
      }

      await _dbService.clearData();

      final problems = await _apiService.getProblems();
      await _dbService.createProblems(problems);

      final cities = await _apiService.getCities();
      await _dbService.createCities(cities);

      for (final city in cities) {
        final futures = await Future.wait([
          _apiService.getInfo(cityId: city.id),
          _apiService.getInfoCategories(),
          _apiService.getSchedule(cityId: city.id),
          _apiService.getStages(cityId: city.id),
          _apiService.getSponsor(cityId: city.id),
        ], eagerError: true);

        final infos = futures[0] as List<InfoModelApi>;
        final infoCategories = futures[1] as List<InfoCategoryModelApi>;
        final performances = futures[2] as List<PerformanceModelApi>;
        final stages = futures[3] as List<StageModelApi>;
        // TODO: Refactor json parsing
        final sponsors = SponsorModelApi.fromHttpResponse(futures[4] as HttpResponse);

        await _dbService.createCityData(
          cityModels: city,
          infoModels: infos,
          infoCategories: infoCategories,
          performanceModels: performances,
          stageModels: stages,
          problemModels: problems,
          previousFavIds: previousFavIds,
          sponsors: sponsors,
        );
      }

      _sharedPreferences.setInt(_keyDataVersion, newVersion);
      _sharedPreferences.setInt(_keyLastSuccessfulUpdate, DateTime.now().millisecondsSinceEpoch);
      return none();
    } on DioException catch (e, s) {
      return some(dioErrorHandler(e, s));
    } catch (e, s) {
      return some(unknownErrorHandler(e, s));
    }
  }
}
