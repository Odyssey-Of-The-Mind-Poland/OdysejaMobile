import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:odyssey_mobile/data/api/api_error_handler.dart';
import 'package:odyssey_mobile/data/api/api_service.dart';
import 'package:odyssey_mobile/data/api/models/info.dart';
import 'package:odyssey_mobile/data/api/models/info_category.dart';
import 'package:odyssey_mobile/data/api/models/performance.dart';
import 'package:odyssey_mobile/data/api/models/sponsor.dart';
import 'package:odyssey_mobile/data/api/models/stage.dart';
import 'package:odyssey_mobile/data/db/hive/hive_service.dart';
import 'package:odyssey_mobile/data/db/hive/models/city.dart';
import 'package:odyssey_mobile/data/failures.dart';
import 'package:odyssey_mobile/domain/failure.dart';
import 'package:odyssey_mobile/domain/entities/city_data.dart';
import 'package:odyssey_mobile/domain/entities/performance.dart';
import 'package:odyssey_mobile/domain/entities/schedule_category_entity.dart';
import 'package:retrofit/retrofit.dart';
import 'package:shared_preferences/shared_preferences.dart';

// TODO: Refactor into separate data and update repositories.
// TODO: Consider API changes to reduce number of small requests.
class DataRepository {
  DataRepository({
    required ApiService apiService,
    required SharedPreferences sharedPrefs,
    required HiveDbService dbService,
  }) : _apiService = apiService,
       _sharedPrefs = sharedPrefs,
       _dbService = dbService;

  final ApiService _apiService;
  final SharedPreferences _sharedPrefs;
  final HiveDbService _dbService;

  Future<Either<Failure, Unit>> updateData({
    bool forceUpdate = false,
    bool keepFavsOnUpdate = true,
  }) async {
    try {
      final versionHttpResult = await _apiService.getVersion();
      final externalVersion = versionHttpResult.data['version'] as int;
      final savedVersion = _sharedPrefs.getInt('version') ?? -1;

      if (forceUpdate || externalVersion > savedVersion) {
        List<int> previousFavIds = [];
        if (savedVersion != -1 && keepFavsOnUpdate) {
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

        _sharedPrefs.setInt('version', externalVersion);
      }

      return right(unit);
    } on DioException catch (e, s) {
      final bool isSaved = (_sharedPrefs.getInt('version') ?? -1) != -1;

      if (isSaved && !forceUpdate) {
        return left(const Offline());
      }
      return left(dioErrorHandler(e, s));
    } catch (e, s) {
      return left(unknownErrorHandler(e, s));
    }
  }

  Future<Either<Failure, CityData>> getCityData(int cityId) async {
    try {
      final data = await _dbService.readCityData(cityId);
      return data != null ? right(data) : left(const DataBaseFailure());
    } catch (e) {
      return left(const DataBaseFailure());
    }
  }

  Future<Either<Failure, List<ScheduleCategoryEntity>>> getProblems() async {
    try {
      final data = await _dbService.readProblems();
      return data.isNotEmpty ? right(data) : left(const DataBaseFailure());
    } catch (e) {
      return left(const DataBaseFailure());
    }
  }

  // Future<Either<Failure, void>> getCities() {
  //   // TODO: implement getCities
  //   throw UnimplementedError();
  // }

  Future<Either<Failure, Unit>> updateFavourite(Performance performance) async {
    try {
      await _dbService.updateFav(performance);
      return right(unit);
    } catch (e) {
      return left(const DataBaseFailure());
    }
  }

  Either<Failure, Iterable<CityHiveModel>> getCities() {
    try {
      final data = _dbService.readCities();
      return data != null ? right(data) : left(const DataBaseFailure());
    } catch (e) {
      return left(const DataBaseFailure());
    }
  }
}
