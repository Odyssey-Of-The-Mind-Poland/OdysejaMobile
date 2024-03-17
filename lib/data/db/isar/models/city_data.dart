import 'package:isar/isar.dart';
import 'package:odyssey_mobile/data/api/models/sponsor.dart';
import 'package:odyssey_mobile/data/db/isar/models/info_group.dart';
import 'package:odyssey_mobile/data/db/isar/models/performance_group.dart';
import 'package:odyssey_mobile/data/db/isar/models/sponsor.dart';
import 'package:odyssey_mobile/data/db/isar/models/stage.dart';
import 'package:odyssey_mobile/domain/entities/city_data.dart';
import 'package:odyssey_mobile/domain/entities/info_category.dart';
import 'package:odyssey_mobile/domain/entities/performance_group.dart';
import 'package:odyssey_mobile/domain/entities/schedule_category_entity.dart';

part 'city_data.g.dart';

@Collection(inheritance: false)
class CityDataModelDb extends CityData {
  Id? id;
  @override
  late String cityName;
  @Index()
  @override
  late int cityId;

  final stageIsarLinks = IsarLinks<StageModelDb>();

  // Move to db service when soritng for Links is available.
  @override
  @ignore
  late List<ScheduleCategoryEntity> stages;

  final performanceGroupIsarLinks = IsarLinks<PerformanceGroupModelDb>();
  @override
  @ignore
  late List<PerformanceGroup> performanceGroups;

  final infoIsarLinks = IsarLinks<InfoGroupModelDb>();
  @override
  @ignore
  late List<InfoCategory> infoGroups;

  final sponsorIsarLinks = IsarLinks<SponsorModelDb>();
  @override
  @ignore
  late List<List<SponsorModelApi>> sponsors;

  void initAndSort() {
    // Assuming other initializations remain the same
    performanceGroups = performanceGroupIsarLinks.toList()
      ..sort((a, b) {
        int cmp = a.problem.compareTo(b.problem);
        if (cmp != 0) return cmp;
        cmp = a.age.compareTo(b.age);
        if (cmp != 0) return cmp;
        cmp = a.league.compareTo(b.league);
        if (cmp != 0) return cmp;
        cmp = a.part.compareTo(b.part);
        if (cmp != 0) return cmp;
        return a.stage.compareTo(b.stage);
      });
    infoGroups = infoIsarLinks.toList()
      ..sort((a, b) => a.number.compareTo(b.number));
    stages = stageIsarLinks.toList()
      ..sort((a, b) => a.number.compareTo(b.number));

    final Map<int, List<SponsorModelDb>> groupedByRow = {};

    for (final sponsorModelDb in sponsorIsarLinks.toList()) {
      final row = sponsorModelDb.row;
      groupedByRow.putIfAbsent(row, () => []).add(sponsorModelDb);
    }

    sponsors = groupedByRow.entries.map((entry) {
      final sortedByColumn = entry.value
        ..sort((a, b) => a.column.compareTo(b.column));
      return sortedByColumn
          .map((sponsorModelDb) => SponsorModelApi(
                id: sponsorModelDb.sponsorId!,
                row: sponsorModelDb.row,
                column: sponsorModelDb.column,
              ))
          .toList();
    }).toList()
      ..sort((a, b) => a[0].row.compareTo(b[0].row));
  }
}
