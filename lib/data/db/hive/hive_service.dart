import 'dart:developer';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:odyssey_mobile/data/api/models/city.dart';
import 'package:odyssey_mobile/data/api/models/info.dart';
import 'package:odyssey_mobile/data/api/models/info_category.dart';
import 'package:odyssey_mobile/data/api/models/performance.dart';
import 'package:odyssey_mobile/data/api/models/problem.dart';
import 'package:odyssey_mobile/data/api/models/stage.dart';
import 'package:odyssey_mobile/data/db/db_service.dart';
import 'package:odyssey_mobile/data/db/isar/models/city_data.dart';
import 'package:odyssey_mobile/domain/entities/performance.dart';
import 'package:odyssey_mobile/domain/entities/schedule_category_entity.dart';

/// Requires awaiting [init] method.
class HiveDbService extends DbService {
  late final Box _box;

  @override
  Future<void> init() async {
    try {
      await Hive.initFlutter();
      _box = await Hive.openBox('finalsBox');
    } catch (e) {
      log('Hive initialization error: $e');
    }
  }

  @override
  Future<void> createProblems(List<ProblemModelApi> problems) async {
    // final data = DataAdapters.convertProblems(problems);
    // return _isar.writeTxn((isar) async {
    //   await isar.problemModelDbs.putAll(data, replaceOnConflict: true);
    // });
  }

  @override
  Future<List<ScheduleCategoryEntity>> readProblems() async {
    return <ScheduleCategoryEntity>[];
  }

  @override
  Future<void> createCityData({
    required List<CityModelApi> cityModels,
    required List<InfoModelApi> infoModels,
    required List<InfoCategoryModelApi> infoCategories,
    required List<PerformanceModelApi> performanceModels,
    required List<StageModelApi> stageModels,
    required List<ProblemModelApi> problemModels,
    required List<int> previousFavIds,
  }) async {
    // final data = DataAdapters.convertCityData(
    //   cityModels: cityModels,
    //   infoModels: infoModels,
    //   infoCategories: infoCategories,
    //   performanceModels: performanceModels,
    //   stageModels: stageModels,
    //   problemModels: problemModels,
    //   previousFavIds: previousFavIds,
    // );
    // return _isar.writeTxn((isar) async =>
    //     await isar.cityDataModelDbs.putAll(data, replaceOnConflict: true, saveLinks: true));
  }

  @override
  Future<CityDataModelDb?> readCityData(int cityId) async {
    // final entry = await _isar.cityDataModelDbs.where().cityIdEqualTo(cityId).findFirst();
    // if (entry == null) {
    //   return entry;
    // }
    // await entry.stageIsarLinks.load();
    // await entry.infoIsarLinks.load();
    // for (final info in entry.infoIsarLinks) {
    //   await info.infoList.load();
    // }
    // await entry.performanceGroupIsarLinks.load();
    // for (final pfGroup in entry.performanceGroupIsarLinks) {
    //   // For multiple small batches of items sync is quicker than async.
    //   pfGroup
    //     ..performancesIsarLinks.loadSync()
    //     ..sortAndInit();
    // }
    // return entry..initAndSort();
  }

  @override
  Future<List<int>> readFavIds() async {
    // return _isar.performanceModelDbs.where().isFavouriteEqualTo(true).performanceIdProperty().findAll();
    return [];
  }

  @override
  Future<void> updateFav(Performance performance) async {
    // return _isar.writeTxn(
    //   (isar) async => await isar.performanceModelDbs.put(performance, replaceOnConflict: true));
  }

  @override
  Future<void> dispose() => Hive.close();
  @override
  Future<void> clearData() => _box.clear();
}
