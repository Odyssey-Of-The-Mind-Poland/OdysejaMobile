import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:odyssey_mobile/core/data/db/hive/models/info_group.dart';
import 'package:odyssey_mobile/core/data/db/hive/models/performance_group.dart';
import 'package:odyssey_mobile/core/data/db/hive/models/sponsor.dart';
import 'package:odyssey_mobile/core/data/db/hive/models/stage.dart';

import 'package:odyssey_mobile/core/domain/city_data.dart';

import 'package:odyssey_mobile/core/data/api/models/sponsor.dart';

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
  final int cityId;

  @override
  final String cityName;

  @override
  final List<InfoGroupHiveModel> infoGroups;

  @override
  final List<PerformanceGroupHiveModel> performanceGroups;

  @override
  final List<StageHiveModel> stages;

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
      final sortedByColumn = entry.value..sort((a, b) => a.column.compareTo(b.column));
      return sortedByColumn
          .map(
            (sponsorModelDb) => SponsorModelApi(
              id: sponsorModelDb.id,
              row: sponsorModelDb.row,
              column: sponsorModelDb.column,
            ),
          )
          .toList();
    }).toList()
      ..sort((a, b) => a[0].row.compareTo(b[0].row));
  }
}
