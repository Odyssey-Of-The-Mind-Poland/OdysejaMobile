import 'package:dartz/dartz.dart';
import 'package:odyssey_mobile/domain/core/failures.dart';
import 'package:odyssey_mobile/domain/entities/city_data.dart';
import 'package:odyssey_mobile/domain/entities/loading_config.dart';
import 'package:odyssey_mobile/domain/entities/performance.dart';
import 'package:odyssey_mobile/domain/entities/schedule_category_entity.dart';

abstract class DataRepository {
  LoadingConfig get loadingConfig;
  set updateLoadingConfig(LoadingConfig lc);
  Future<Either<Failure, Unit>> updateData({bool forceUpdate = false, keepFavsOnUpdate = true});
  // Future<Either<Failure, void>> getCities();
  Future<Either<Failure, CityData>> getCityData(int cityId);
  Future<Either<Failure, List<ScheduleCategoryEntity>>> getProblems();
  Future<Either<Failure, Unit>> updateFavourite(Performance performance);
}
