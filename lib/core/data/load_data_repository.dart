import 'package:dartz/dartz.dart';
import 'package:odyssey_mobile/core/data/db/hive/hive_service.dart';
import 'package:odyssey_mobile/core/data/db/hive/models/city.dart';
import 'package:odyssey_mobile/core/data/services/division_style_store.dart';
import 'package:odyssey_mobile/core/data/failures.dart';
import 'package:odyssey_mobile/core/failure.dart';
import 'package:odyssey_mobile/core/domain/city_data.dart';
import 'package:odyssey_mobile/core/domain/performance.dart';
import 'package:odyssey_mobile/core/domain/schedule_category_entity.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoadDataRepository {
  LoadDataRepository({required HiveDbService dbService, required SharedPreferences sharedPreferences})
      : _dbService = dbService,
        _sharedPreferences = sharedPreferences;

  final HiveDbService _dbService;
  final SharedPreferences _sharedPreferences;

  /// The age groups, styled the way editors set them (as of the last data update).
  List<DivisionEntity> getDivisions() => DivisionStyleStore(_sharedPreferences).divisions;

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
