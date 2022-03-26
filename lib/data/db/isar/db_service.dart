import 'package:isar/isar.dart';
import 'package:odyssey_mobile/data/db/isar/models/city_data.dart';
import 'package:odyssey_mobile/data/db/isar/models/info.dart';
import 'package:odyssey_mobile/data/db/isar/models/info_group.dart';
import 'package:odyssey_mobile/data/db/isar/models/performance.dart';
import 'package:odyssey_mobile/data/db/isar/models/performance_group.dart';
import 'package:odyssey_mobile/data/db/isar/models/problem.dart';
import 'package:odyssey_mobile/data/db/isar/models/stage.dart';
import 'package:path_provider/path_provider.dart';

/// Requires awaiting [init] method.
class DbService {
  late final Isar _isar;

  Isar get db => _isar;

  Future<void> init() async {
    try {
      final dir = await getApplicationSupportDirectory(); // path_provider package
      _isar = await Isar.open(
        schemas: _schemas,
        directory: dir.path,
        inspector: true, // if you want to enable the inspector for debug builds
      );
    } catch (e) {
      print(e);
    }
  }

  Future<void> createProblems(List<ProblemModelDb> problems) => _isar.writeTxn((isar) async {
        await isar.problemModelDbs.putAll(problems, replaceOnConflict: true);
      });

  Future<List<ProblemModelDb>> readProblems() =>
      _isar.problemModelDbs.where().anyNumber().findAll();

  Future<void> createCityData(List<CityDataModelDb> cityData) => _isar.writeTxn((isar) async =>
      await isar.cityDataModelDbs.putAll(cityData, replaceOnConflict: true, saveLinks: true));

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

  Future<List<int>> readFavIds() =>
      _isar.performanceModelDbs.where().isFavouriteEqualTo(true).performanceIdProperty().findAll();

  Future<void> updateFav(PerformanceModelDb performance) => _isar.writeTxn(
      (isar) async => await isar.performanceModelDbs.put(performance, replaceOnConflict: true));

  // TODO add some form of health check for the database
  Future<void> checkIntegrity() => throw UnimplementedError();

  void dispose() => _isar.close();

  Future<void> clearData() async => _isar.writeTxn((isar) => isar.clear());
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
