import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:odyssey_mobile/app/injectable.dart';
import 'package:odyssey_mobile/core/data/api/api_error_handler.dart';
import 'package:odyssey_mobile/core/data/api/api_service.dart';
import 'package:odyssey_mobile/core/data/api/models/city.dart';
import 'package:odyssey_mobile/core/data/api/models/info.dart';
import 'package:odyssey_mobile/core/data/api/models/info_category.dart';
import 'package:odyssey_mobile/core/data/api/models/performance.dart';
import 'package:odyssey_mobile/core/data/api/models/problem.dart';
import 'package:odyssey_mobile/core/data/api/models/sponsor.dart';
import 'package:odyssey_mobile/core/data/api/models/stage.dart';
import 'package:odyssey_mobile/core/data/db/hive/hive_service.dart';
import 'package:odyssey_mobile/core/data/services/logger_service.dart';
import 'package:odyssey_mobile/core/data/services/package_info_service.dart';
import 'package:odyssey_mobile/core/data/services/store_service.dart';
import 'package:odyssey_mobile/core/typedefs.dart';
import 'package:odyssey_mobile/features/update_data/domain/app_update_status.dart';
import 'package:retrofit/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
  static const _keyDataDirty = 'dataDirty';
  static const _keyLastUpdateCheck = 'lastCheck';
  static const _keySkippedAppUpdates = 'skippedAppUpdates';

  bool shouldCheckForUpdates(Duration throttleTime) {
    final lastUpdateCheck = _sharedPreferences.getInt(_keyLastUpdateCheck);

    return lastUpdateCheck == null ||
        DateTime.now()
            .isAfter(DateTime.fromMillisecondsSinceEpoch(lastUpdateCheck).add(throttleTime));
  }

  Future<void> saveCheckDate() =>
      _sharedPreferences.setInt(_keyLastUpdateCheck, DateTime.now().millisecondsSinceEpoch);

  Future<void> markDataAsDirty() => _sharedPreferences.setBool(_keyDataDirty, true);

  Future<void> clearDataDirtyFlagIfAny() => _sharedPreferences.remove(_keyDataDirty);

  bool get isDataDirty => _sharedPreferences.getBool(_keyDataDirty) ?? false;

  Future<void> saveDataVersion(int version) => _sharedPreferences.setInt(_keyDataVersion, version);

  bool get isOfflineModeAvailable => _dbService.validateDatabase();

  String? _pendingAppUpdateVersion;

  Future<void> markAppUpdateAsSkipped() async {
    final pendingVersion = _pendingAppUpdateVersion;
    if (pendingVersion == null) return;
    _sharedPreferences.setString(_keySkippedAppUpdates, pendingVersion);
  }

  bool isAppUpdateSkipped(String version) =>
      _sharedPreferences.getString(_keySkippedAppUpdates) == version;

  AsyncResult<AppUpdateStatus> checkAppAPICompatibility() async {
    try {
      final currentVersion = _packageInfoService.version;

      final isIncompatibleFuture = _apiService.getShouldUpdate(currentVersion);
      final storeFuture = _storeService.checkForUpdates();

      final results = await Future.wait([isIncompatibleFuture, storeFuture], eagerError: false);

      final isIncompatible = (results[0] as HttpResponse<bool>).data;
      final storeData = results[1] as StoreData?;

      late AppUpdateStatus status;

      switch ((isIncompatible, storeData?.canUpdate)) {
        case (false, true):
          if (isAppUpdateSkipped(storeData!.storeVersion)) {
            status = AppUpdateStatus.versionSkipped;
            break;
          }
          status = AppUpdateStatus.recommended;
          _pendingAppUpdateVersion = storeData.storeVersion;
          break;
        case (false, false):
        case (false, null):
          status = AppUpdateStatus.upToDate;
          break;
        case (true, true):
          status = AppUpdateStatus.required;
          break;
        case (true, null):
        case (true, false):
          status = AppUpdateStatus.impossible;
          sl.maybeGet<LoggerService>()?.logError(
              'Reached impossible update condition',
              {
                'storeVersion': storeData?.storeVersion,
                'currentVersion': currentVersion,
                'isIncompatible': isIncompatible,
              },
              StackTrace.current);
      }

      return right(status);
    } on DioException catch (e, s) {
      return left(dioErrorHandler(e, s));
    } catch (e, s) {
      return left(unknownErrorHandler(e, s));
    }
  }

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

      final commonData = await Future.wait([
        _apiService.getProblems(),
        _apiService.getCities(),
      ], eagerError: true);

      final problems = commonData[0] as List<ProblemModelApi>;
      final cities = commonData[1] as List<CityModelApi>;

      await _dbService.createProblems(problems);
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
      return none();
    } on DioException catch (e, s) {
      return some(dioErrorHandler(e, s));
    } catch (e, s) {
      return some(unknownErrorHandler(e, s));
    }
  }
}
