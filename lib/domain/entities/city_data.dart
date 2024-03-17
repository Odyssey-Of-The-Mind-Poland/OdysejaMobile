import 'package:odyssey_mobile/domain/entities/info_category.dart';
import 'package:odyssey_mobile/domain/entities/performance_group.dart';
import 'package:odyssey_mobile/domain/entities/schedule_category_entity.dart';

import '../../data/api/models/sponsor.dart';

abstract class CityData {
  String get cityName;
  int get cityId;
  List<ScheduleCategoryEntity> get stages;
  List<PerformanceGroup> get performanceGroups;
  List<InfoCategory> get infoGroups;
  List<List<SponsorModelApi>> get sponsors;
}
