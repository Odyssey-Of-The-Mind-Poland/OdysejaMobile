import 'package:hive_flutter/hive_flutter.dart';
import 'package:odyssey_mobile/data/db/hive/models/info_group.dart';
import 'package:odyssey_mobile/data/db/hive/models/performance_group.dart';
import 'package:odyssey_mobile/data/db/hive/models/stage.dart';

import 'package:odyssey_mobile/domain/entities/city_data.dart';

import '../../../api/models/sponsor.dart';

part 'city_data.g.dart';

@HiveType(typeId: 0)
class CityDataHiveModel extends CityData with HiveObjectMixin {
  CityDataHiveModel({
    required this.cityId,
    required this.cityName,
    required this.infoGroups,
    required this.performanceGroups,
    required this.stages,
    required this.sponsors,
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

  @HiveField(5)
  @override
  final List<List<SponsorModelApi>> sponsors;
}
