import 'dart:developer';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:odyssey_mobile/data/api/models/city.dart';
import 'package:odyssey_mobile/data/api/models/info.dart';
import 'package:odyssey_mobile/data/api/models/info_category.dart';
import 'package:odyssey_mobile/data/api/models/performance.dart';
import 'package:odyssey_mobile/data/api/models/problem.dart';
import 'package:odyssey_mobile/data/api/models/stage.dart';
import 'package:odyssey_mobile/data/db/db_service.dart';
import 'package:odyssey_mobile/data/db/hive/hive_data_adapter.dart';
import 'package:odyssey_mobile/data/db/hive/models/city_data.dart';
import 'package:odyssey_mobile/data/db/hive/models/info.dart';
import 'package:odyssey_mobile/data/db/hive/models/info_group.dart';
import 'package:odyssey_mobile/data/db/hive/models/performance.dart';
import 'package:odyssey_mobile/data/db/hive/models/performance_group.dart';
import 'package:odyssey_mobile/data/db/hive/models/problem.dart';
import 'package:odyssey_mobile/data/db/hive/models/stage.dart';
import 'package:odyssey_mobile/domain/entities/performance.dart';
import 'package:odyssey_mobile/domain/entities/schedule_category_entity.dart';

class HiveDbService extends DbService {
  HiveDbService._create();

  late final Box<CityDataHiveModel> _box;
  late final Box<ProblemHiveModel> _pandoraBox;
  late final Box<PerformanceHiveModel> _performanceBox;

  static Future<HiveDbService> create() async {
    final service = HiveDbService._create();
    await service._init();
    return service;
  }

  Future<void> _init() async {
    try {
      Hive.registerAdapter(CityDataHiveModelAdapter());
      Hive.registerAdapter(InfoGroupHiveModelAdapter());
      Hive.registerAdapter(InfoHiveModelAdapter());
      Hive.registerAdapter(PerformanceGroupHiveModelAdapter());
      Hive.registerAdapter(PerformanceHiveModelAdapter());
      Hive.registerAdapter(ProblemHiveModelAdapter());
      Hive.registerAdapter(StageHiveModelAdapter());
      await Hive.initFlutter();

      _box = await Hive.openBox('finalsBox', compactionStrategy: (entries, deletedEntries) {
        return deletedEntries > 2;
      });
      _pandoraBox = await Hive.openBox('pandoraBox', compactionStrategy: (entries, deletedEntries) {
        return deletedEntries > 12;
      });
      _performanceBox =
          await Hive.openBox('performanceBox', compactionStrategy: (entries, deletedEntries) {
        return deletedEntries > 50;
      });
    } catch (e) {
      log('Hive initialization error: $e');
    }
  }

  @override
  Future<void> createProblems(List<ProblemModelApi> problems) async {
    final data = problems.map((e) => ProblemHiveModel(e.name, e.id));
    await _pandoraBox.addAll(data);
  }

  @override
  Future<List<ScheduleCategoryEntity>> readProblems() async =>
      _pandoraBox.values.toList()..sort((a, b) => a.number.compareTo(b.number));

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
    // save performances first, to allow them to work as HiveObjects
    final performances = HiveDataAdapter.convertPerformances(performanceModels, previousFavIds);
    _performanceBox.addAll(performances);

    final data = HiveDataAdapter.convertCityData(
      cityModels: cityModels,
      infoModels: infoModels,
      infoCategories: infoCategories,
      performanceModels: _performanceBox.values.toList(),
      stageModels: stageModels,
      problemModels: problemModels,
      previousFavIds: previousFavIds,
      performanceBox: _performanceBox,
    );
    await _box.addAll(data);
    // for (final group in data.first.performanceGroups) {
    //   group.performances.forEach((e) async {e.updatePerformance()});
    // }
  }

  @override
  Future<CityDataHiveModel?> readCityData(int cityId) async => _box.get(0);

  @override
  Future<List<int>> readFavIds() async =>
      _performanceBox.values.where((p) => p.isFavourite).map((e) => e.performanceId).toList();

  @override
  Future<void> updateFav(Performance performance) async {
    try {
      await performance.updatePerformance();
    } catch (e) {
      log(e.toString());
    }
  }

  @override
  Future<void> dispose() => Hive.close();

  @override
  Future<void> clearData() async {
    await _box.clear();
    await _pandoraBox.clear();
    await _performanceBox.clear();
  }
}
