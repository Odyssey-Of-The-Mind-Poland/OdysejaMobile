import 'package:odyssey_mobile/data/api/models/city.dart';
import 'package:odyssey_mobile/data/api/models/info.dart';
import 'package:odyssey_mobile/data/api/models/info_category.dart';
import 'package:odyssey_mobile/data/api/models/performance.dart';
import 'package:odyssey_mobile/data/api/models/problem.dart';
import 'package:odyssey_mobile/data/api/models/stage.dart';
import 'package:odyssey_mobile/domain/entities/city_data.dart';
import 'package:odyssey_mobile/domain/entities/performance.dart';
import 'package:odyssey_mobile/domain/entities/schedule_category_entity.dart';

abstract class DbService {
  Future<void> init();

  Future<void> createProblems(List<ProblemModelApi> problems);

  Future<List<ScheduleCategoryEntity>> readProblems();

  Future<void> createCityData(
      {required List<CityModelApi> cityModels,
      required List<InfoModelApi> infoModels,
      required List<InfoCategoryModelApi> infoCategories,
      required List<PerformanceModelApi> performanceModels,
      required List<StageModelApi> stageModels,
      required List<ProblemModelApi> problemModels,
      required List<int> previousFavIds});

  Future<CityData?> readCityData(int cityId);

  Future<List<int>> readFavIds();

  Future<void> updateFav(Performance performance);

  Future<void> dispose();

  Future<void> clearData();
}
