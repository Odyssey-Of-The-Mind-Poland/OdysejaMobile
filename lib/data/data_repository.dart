import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:odyssey_mobile/data/api/api_error_handler.dart';
import 'package:odyssey_mobile/data/api/api_service.dart';
import 'package:odyssey_mobile/data/api/models/city.dart';
import 'package:odyssey_mobile/data/api/models/info.dart';
import 'package:odyssey_mobile/data/api/models/info_category.dart';
import 'package:odyssey_mobile/data/api/models/performance.dart';
import 'package:odyssey_mobile/data/api/models/problem.dart';
import 'package:odyssey_mobile/data/api/models/sponsor.dart';
import 'package:odyssey_mobile/data/api/models/stage.dart';
import 'package:odyssey_mobile/data/db/db_service.dart';
import 'package:odyssey_mobile/domain/core/failures.dart';
import 'package:odyssey_mobile/domain/data_repository.dart';
import 'package:odyssey_mobile/domain/entities/city_data.dart';
import 'package:odyssey_mobile/domain/entities/performance.dart';
import 'package:odyssey_mobile/domain/entities/schedule_category_entity.dart';
import 'package:shared_preferences/shared_preferences.dart';

@Environment('prod')
@Injectable(as: DataRepository)
class DataRepositoryImpl implements DataRepository {
  DataRepositoryImpl(this._apiService, this._sharedPrefs, this._dbService);

  final ApiService _apiService;
  final SharedPreferences _sharedPrefs;
  final DbService _dbService;

  @override
  Future<Either<Failure, Unit>> updateData(
      {bool forceUpdate = false, keepFavsOnUpdate = true}) async {
    try {
      final versionHttpResult = await _apiService.getVersion();
      final externalVersion = versionHttpResult.data['version'] as int;
      final savedVersion = _sharedPrefs.getInt('version') ?? -1;

      if (true || externalVersion > savedVersion) {
        final futures = await Future.wait([
          // _apiService.getCities(),
          _apiService.getInfo(),
          _apiService.getInfoCategories(),
          _apiService.getProblems(),
          _apiService.getSchedule(),
          _apiService.getStages(),
          _apiService.getSponsor(),
        ], eagerError: true);

        /// TODO update for future editions with multiple cities
        final cities = [CityModelApi(id: 0, name: 'Finał Ogólnopolski')];
        // futures[0] as List<CityModel>;
        final infos = futures[0] as List<InfoModelApi>;
        final infoCategories = futures[1] as List<InfoCategoryModelApi>;
        final problems = futures[2] as List<ProblemModelApi>;
        final performances = futures[3] as List<PerformanceModelApi>;
        final stages = futures[4] as List<StageModelApi>;
        final sponsors = futures[5] as List<List<SponsorModelApi>>;

        List<int> previousFavIds = [];
        if (savedVersion != -1 && keepFavsOnUpdate) {
          previousFavIds = await _dbService.readFavIds();
        }

        await _dbService.clearData();

        await _dbService.createProblems(problems);
        await _dbService.createCityData(
          cityModels: cities,
          infoModels: infos,
          infoCategories: infoCategories,
          performanceModels: performances,
          stageModels: stages,
          problemModels: problems,
          previousFavIds: previousFavIds,
          sponsors: sponsors
        );

        // On full success, save version.
        _sharedPrefs.setInt('version', externalVersion);
      }

      return right(unit);
    } on DioError catch (e) {
      final bool isSaved = (_sharedPrefs.getInt('version') ?? -1) != -1;

      if (isSaved && !forceUpdate) {
        return left(const Offline());
      }
      return left(dioErrorHandler(e));
    } catch (e, s) {
      return left(unknownErrorHandler(e, s));
    }
  }

  @override
  Future<Either<Failure, CityData>> getCityData(int cityId) async {
    try {
      final data = await _dbService.readCityData(cityId);
      return data != null ? right(data) : left(const DataBaseFailure());
    } catch (e) {
      return left(const DataBaseFailure());
    }
  }

  @override
  Future<Either<Failure, List<ScheduleCategoryEntity>>> getProblems() async {
    try {
      final data = await _dbService.readProblems();
      return data.isNotEmpty ? right(data) : left(const DataBaseFailure());
    } catch (e) {
      return left(const DataBaseFailure());
    }
  }

  // @override
  // Future<Either<Failure, void>> getCities() {
  //   // TODO: implement getCities
  //   throw UnimplementedError();
  // }

  @override
  Future<Either<Failure, Unit>> updateFavourite(Performance performance) async {
    try {
      await _dbService.updateFav(performance);
      return right(unit);
    } catch (e) {
      return left(const DataBaseFailure());
    }
  }

  // @override
  // LoadingConfig get loadingConfig {
  //   final showOnboarding = _sharedPrefs.getBool('showOnboarding') ?? true;
  //   return LoadingConfig(showOnboarding: showOnboarding);
  // }

  // @override
  // set updateLoadingConfig(LoadingConfig lc) {
  //   _sharedPrefs.setBool('showOnboarding', lc.showOnboarding);
  // }
}
