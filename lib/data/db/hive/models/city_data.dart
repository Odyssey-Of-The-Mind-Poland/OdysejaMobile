import 'package:hive_flutter/hive_flutter.dart';
import 'package:odyssey_mobile/data/db/hive/models/info_group.dart';
import 'package:odyssey_mobile/data/db/hive/models/performance_group.dart';
import 'package:odyssey_mobile/data/db/hive/models/sponsor.dart';
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
    required this.sponsorModel,
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
  final List<SponsorHiveModel> sponsorModel;

  @override
  get sponsors => getSponsors();

  List<List<SponsorModelApi>> getSponsors() {
    final Map<int, List<SponsorHiveModel>> groupedByRow = {};

    for (final sponsorModelDb in sponsorModel.toList()) {
      final row = sponsorModelDb.row;
      groupedByRow.putIfAbsent(row, () => []).add(sponsorModelDb);
    }

    return groupedByRow.entries.map((entry) {
      final sortedByColumn = entry.value
        ..sort((a, b) => a.column.compareTo(b.column));
      return sortedByColumn
          .map((sponsorModelDb) => SponsorModelApi(
        id: sponsorModelDb.id,
        row: sponsorModelDb.row,
        column: sponsorModelDb.column,
      ))
          .toList();
    }).toList()
      ..sort((a, b) => a[0].row.compareTo(b[0].row));
  }
}
