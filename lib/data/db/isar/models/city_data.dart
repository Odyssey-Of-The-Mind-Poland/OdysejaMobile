import 'package:isar/isar.dart';
import 'package:odyssey_mobile/data/db/isar/models/info_group.dart';
import 'package:odyssey_mobile/data/db/isar/models/performance_group.dart';
import 'package:odyssey_mobile/data/db/isar/models/stage.dart';
import 'package:odyssey_mobile/domain/entities/city_data.dart';
import 'package:odyssey_mobile/domain/entities/info_category.dart';
import 'package:odyssey_mobile/domain/entities/performance_group.dart';
import 'package:odyssey_mobile/domain/entities/schedule_category_entity.dart';

part 'city_data.g.dart';

@Collection()
class CityDataModelDb extends CityData {
  int? id;
  @override
  late String cityName;
  @Index()
  @override
  late int cityId;

  final stageIsarLinks = IsarLinks<StageModelDb>();
  // Move to db service when soritng for Links is available.
  @override
  late List<ScheduleCategoryEntity> stages;

  final performanceGroupIsarLinks = IsarLinks<PerformanceGroupModelDb>();
  @override
  late List<PerformanceGroup> performanceGroups;

  final infoIsarLinks = IsarLinks<InfoGroupModelDb>();
  @override
  late List<InfoCategory> infoGroups;

  void initAndSort() {
    performanceGroups = performanceGroupIsarLinks.toList()
      ..sort((a, b) {
        int cmp = a.problem.compareTo(b.problem);
        if (cmp != 0) return cmp;
        cmp = a.age.compareTo(b.age);
        if (cmp != 0) return cmp;
        cmp = a.stage.compareTo(b.stage);
        if (cmp != 0) return cmp;
        return a.part.compareTo(b.part);
      });
    infoGroups = infoIsarLinks.toList()..sort((a, b) => a.number.compareTo(b.number));
    stages = stageIsarLinks.toList()..sort((a, b) => a.number.compareTo(b.number));
  }
}
