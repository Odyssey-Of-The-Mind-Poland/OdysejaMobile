import 'package:hive_flutter/hive_flutter.dart';
import 'package:odyssey_mobile/data/db/hive/models/info_group.dart';
import 'package:odyssey_mobile/data/db/hive/models/performance_group.dart';
import 'package:odyssey_mobile/data/db/hive/models/stage.dart';

import 'package:odyssey_mobile/domain/entities/city_data.dart';

part 'city_data.g.dart';

@HiveType(typeId: 0)
class CityDataHiveModel extends CityData with HiveObjectMixin {
  CityDataHiveModel({
    required this.cityId,
    required this.cityName,
    required this.infoGroups,
    required this.performanceGroups,
    required this.stages,
  });

  @override
  @HiveField(0)
  final int cityId;

  @HiveField(1)
  @override
  final String cityName;

  @HiveField(2)
  @override
  final List<InfoGroupHiveModel> infoGroups;

  @HiveField(3)
  @override
  final List<PerformanceGroupHiveModel> performanceGroups;

  @HiveField(4)
  @override
  final List<StageHiveModel> stages;
}
