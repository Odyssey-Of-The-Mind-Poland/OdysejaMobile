import 'dart:developer';
import 'package:get_it/get_it.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:odyssey_mobile/app/injectable.dart';
import 'package:odyssey_mobile/core/data/api/models/city.dart';
import 'package:odyssey_mobile/core/data/api/models/info.dart';
import 'package:odyssey_mobile/core/data/api/models/info_category.dart';
import 'package:odyssey_mobile/core/data/api/models/performance.dart';
import 'package:odyssey_mobile/core/data/api/models/problem.dart';
import 'package:odyssey_mobile/core/data/api/models/sponsor.dart';
import 'package:odyssey_mobile/core/data/api/models/stage.dart';
import 'package:odyssey_mobile/core/data/db/hive/hive_data_adapter.dart';
import 'package:odyssey_mobile/core/data/db/hive/hive_registrar.g.dart';
import 'package:odyssey_mobile/core/data/db/hive/models/city_data.dart';
import 'package:odyssey_mobile/core/data/db/hive/models/info.dart';
import 'package:odyssey_mobile/core/data/db/hive/models/info_group.dart';
import 'package:odyssey_mobile/core/data/db/hive/models/performance.dart';
import 'package:odyssey_mobile/core/data/db/hive/models/performance_group.dart';
import 'package:odyssey_mobile/core/data/db/hive/models/problem.dart';
import 'package:odyssey_mobile/core/data/db/hive/models/sponsor.dart';
import 'package:odyssey_mobile/core/data/db/hive/models/stage.dart';
import 'package:odyssey_mobile/core/data/services/logger_service.dart';
import 'package:odyssey_mobile/core/domain/performance.dart';
import 'package:odyssey_mobile/core/domain/schedule_category_entity.dart';

import 'models/city.dart';

part 'hive_service.g.dart';

// TODO: Refactor, there should be seperate boxes per city.
// Opening a box loads its content into memory and there is no point
// in loading all the cities at the same time.
@GenerateAdapters([
  AdapterSpec<CityDataHiveModel>(),
  AdapterSpec<CityHiveModel>(),
  AdapterSpec<InfoGroupHiveModel>(),
  AdapterSpec<InfoHiveModel>(),
  AdapterSpec<PerformanceGroupHiveModel>(),
  AdapterSpec<PerformanceHiveModel>(),
  AdapterSpec<ProblemHiveModel>(),
  AdapterSpec<SponsorHiveModel>(),
  AdapterSpec<StageHiveModel>(),
])
class HiveDbService {
  HiveDbService._create();

  late Box<CityDataHiveModel> _box;
  late Box<ProblemHiveModel> _pandoraBox;
  late Box<PerformanceHiveModel> _performanceBox;
  late Box<CityHiveModel> _citiesBox;

  bool? initSuccess;

  static Future<HiveDbService> create() async {
    final service = HiveDbService._create();
    Hive.registerAdapters();
    await service._init();
    return service;
  }

  Future<void> _init() async {
    try {
      await Hive.initFlutter();
      _box = await Hive.openBox(
        'finalsBox',
        compactionStrategy: (entries, deletedEntries) {
          return deletedEntries > 2;
        },
      );
      _pandoraBox = await Hive.openBox(
        'pandoraBox',
        compactionStrategy: (entries, deletedEntries) {
          return deletedEntries > 12;
        },
      );
      _performanceBox = await Hive.openBox(
        'performanceBox',
        compactionStrategy: (entries, deletedEntries) {
          return deletedEntries > 50;
        },
      );
      _citiesBox = await Hive.openBox(
        'citiesBox',
        compactionStrategy: (entries, deletedEntries) {
          return deletedEntries > 3;
        },
      );
      initSuccess = true;
    } catch (e, s) {
      sl.maybeGet<LoggerService>()?.logWarning('Hive initialization error, trying db reset', e, s);
      if (initSuccess == null) {
        initSuccess = false;
        await _retryInit();
      }
    }
  }

  Future<void> _retryInit() async {
    await _deleteDbFiles();
    await _init();
  }

  Future<void> _deleteDbFiles() async {
    await Hive.deleteBoxFromDisk('finalsBox');
    await Hive.deleteBoxFromDisk('pandoraBox');
    await Hive.deleteBoxFromDisk('performanceBox');
    await Hive.deleteBoxFromDisk('citiesBox');
  }

  Future<void> createProblems(List<ProblemModelApi> problems) async {
    final data = problems.map((e) => ProblemHiveModel(e.name, e.id)).toList()
      ..sort((a, b) => a.number.compareTo(b.number));
    await _pandoraBox.addAll(data);
  }

  Future<List<ScheduleCategoryEntity>> readProblems() async => _pandoraBox.values.toList();

  Future<void> createCityData({
    required CityModelApi cityModels,
    required List<InfoModelApi> infoModels,
    required List<InfoCategoryModelApi> infoCategories,
    required List<PerformanceModelApi> performanceModels,
    required List<StageModelApi> stageModels,
    required List<ProblemModelApi> problemModels,
    required List<int> previousFavIds,
    required List<List<SponsorModelApi>> sponsors,
  }) async {
    // save performances first, to allow them to work as HiveObjects
    final performances = HiveDataAdapter.convertPerformances(performanceModels, previousFavIds);
    _performanceBox.addAll(performances);

    final data = HiveDataAdapter.convertCityData(
      city: cityModels,
      infoModels: infoModels,
      infoCategories: infoCategories,
      performanceModels: _performanceBox.values.toList(),
      stageModels: stageModels,
      problemModels: problemModels,
      previousFavIds: previousFavIds,
      performanceBox: _performanceBox,
      sponsors: sponsors,
    );
    await _box.addAll(data);
  }

  Future<CityDataHiveModel> readCityData(int cityId) async {
    try {
      return _box.values.firstWhere((city) => city.cityId == cityId);
    } catch (e) {
      throw Exception('City with ID $cityId not found');
    }
  }

  Future<List<int>> readFavIds() async =>
      _performanceBox.values.where((p) => p.isFavourite).map((e) => e.performanceId).toList();

  Future<void> updateFav(Performance performance) async {
    try {
      await performance.updatePerformance();
    } catch (e) {
      log(e.toString());
    }
  }

  Future<void> dispose() => Hive.close();

  Future<void> clearData() async {
    await _box.clear();
    await _pandoraBox.clear();
    await _performanceBox.clear();
    await _citiesBox.clear();
  }

  createCities(List<CityModelApi> cities) {
    _citiesBox.addAll(cities.map((c) => CityHiveModel.fromCityApiModel(c)).toList());
  }

  Iterable<CityHiveModel> readCities() {
    return _citiesBox.values;
  }

  bool validateDatabase() =>
      _box.isNotEmpty &&
      _pandoraBox.isNotEmpty &&
      _performanceBox.isNotEmpty &&
      _citiesBox.isNotEmpty;
}
