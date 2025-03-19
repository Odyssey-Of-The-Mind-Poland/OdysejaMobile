import 'package:odyssey_mobile/core/domain/info_category.dart';
import 'package:odyssey_mobile/core/domain/performance_group.dart';
import 'package:odyssey_mobile/core/domain/schedule_category_entity.dart';

import '../data/api/models/sponsor.dart';

abstract class CityData {
  String get cityName;
  int get cityId;
  List<ScheduleCategoryEntity> get stages;
  List<PerformanceGroup> get performanceGroups;
  List<InfoCategory> get infoGroups;
  List<List<SponsorModelApi>> get sponsors;
}
