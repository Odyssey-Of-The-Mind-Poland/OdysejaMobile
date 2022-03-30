import 'dart:developer';

import 'package:isar/isar.dart';
import 'package:odyssey_mobile/data/api/models/city.dart';
import 'package:odyssey_mobile/data/api/models/info.dart';
import 'package:odyssey_mobile/data/api/models/info_category.dart';
import 'package:odyssey_mobile/data/api/models/performance.dart';
import 'package:odyssey_mobile/data/api/models/problem.dart';
import 'package:odyssey_mobile/data/api/models/stage.dart';
import 'package:odyssey_mobile/data/db/db_service.dart';
import 'package:odyssey_mobile/data/db/isar/isar_data_adapters.dart';
import 'package:odyssey_mobile/data/db/isar/models/city_data.dart';
import 'package:odyssey_mobile/data/db/isar/models/info.dart';
import 'package:odyssey_mobile/data/db/isar/models/info_group.dart';
import 'package:odyssey_mobile/data/db/isar/models/performance.dart';
import 'package:odyssey_mobile/data/db/isar/models/performance_group.dart';
import 'package:odyssey_mobile/data/db/isar/models/problem.dart';
import 'package:odyssey_mobile/data/db/isar/models/stage.dart';
import 'package:odyssey_mobile/domain/entities/performance.dart';
import 'package:path_provider/path_provider.dart';

/// Requires awaiting [init] method.
class IsarDbService implements DbService {
  late final Isar _isar;

  @override
  Future<void> init() async {
    try {
      final dir = await getApplicationSupportDirectory(); // path_provider package
      _isar = await Isar.open(
        schemas: _schemas,
        directory: dir.path,
        inspector: true, // if you want to enable the inspector for debug builds
      );
    } catch (e) {
      log('Isar initialization error: $e');
    }
  }

  @override
  Future<void> createProblems(List<ProblemModelApi> problems) {
    final data = IsarDataAdapters.convertProblems(problems);
    return _isar.writeTxn((isar) async {
      await isar.problemModelDbs.putAll(data, replaceOnConflict: true);
    });
  }

  @override
  Future<List<ProblemModelDb>> readProblems() =>
      _isar.problemModelDbs.where().anyNumber().findAll();

  @override
  Future<void> createCityData({
    required List<CityModelApi> cityModels,
    required List<InfoModelApi> infoModels,
    required List<InfoCategoryModelApi> infoCategories,
    required List<PerformanceModelApi> performanceModels,
    required List<StageModelApi> stageModels,
    required List<ProblemModelApi> problemModels,
    required List<int> previousFavIds,
  }) {
    final data = IsarDataAdapters.convertCityData(
      cityModels: cityModels,
      infoModels: infoModels,
      infoCategories: infoCategories,
      performanceModels: performanceModels,
      stageModels: stageModels,
      problemModels: problemModels,
      previousFavIds: previousFavIds,
    );
    return _isar.writeTxn((isar) async =>
        await isar.cityDataModelDbs.putAll(data, replaceOnConflict: true, saveLinks: true));
  }

  @override
  Future<CityDataModelDb?> readCityData(int cityId) async {
    final entry = await _isar.cityDataModelDbs.where().cityIdEqualTo(cityId).findFirst();
    if (entry == null) {
      return entry;
    }
    await entry.stageIsarLinks.load();
    await entry.infoIsarLinks.load();
    for (final info in entry.infoIsarLinks) {
      await info.infoList.load();
    }
    await entry.performanceGroupIsarLinks.load();
    for (final pfGroup in entry.performanceGroupIsarLinks) {
      // For multiple small batches of items sync is quicker than async.
      pfGroup
        ..performancesIsarLinks.loadSync()
        ..sortAndInit();
    }
    return entry..initAndSort();
  }

  @override
  Future<List<int>> readFavIds() =>
      _isar.performanceModelDbs.where().isFavouriteEqualTo(true).performanceIdProperty().findAll();

  @override
  Future<void> updateFav(Performance performance) =>
      _isar.writeTxn((isar) async => await isar.performanceModelDbs
          .put(performance as PerformanceModelDb, replaceOnConflict: true));

  // TODO add some form of health check for the database
  Future<void> checkIntegrity() => throw UnimplementedError();

  @override
  Future<void> dispose() => _isar.close();

  @override
  Future<void> clearData() {
    return _isar.writeTxn((isar) => isar.clear());
  }
}

final List<CollectionSchema<dynamic>> _schemas = [
  CityDataModelDbSchema,
  InfoGroupModelDbSchema,
  InfoModelDbSchema,
  PerformanceGroupModelDbSchema,
  PerformanceModelDbSchema,
  ProblemModelDbSchema,
  StageModelDbSchema,
];
