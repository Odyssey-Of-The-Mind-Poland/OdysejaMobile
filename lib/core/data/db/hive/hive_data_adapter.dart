import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';
import 'package:odyssey_mobile/core/data/api/models/city.dart';
import 'package:odyssey_mobile/core/data/api/models/info.dart';
import 'package:odyssey_mobile/core/data/api/models/info_category.dart';
import 'package:odyssey_mobile/core/data/api/models/performance.dart';
import 'package:odyssey_mobile/core/data/api/models/performance_group_v2.dart';
import 'package:odyssey_mobile/core/data/api/models/stage.dart';
import 'package:odyssey_mobile/core/data/db/hive/models/city_data.dart';
import 'package:odyssey_mobile/core/data/db/hive/models/info.dart';
import 'package:odyssey_mobile/core/data/db/hive/models/info_group.dart';
import 'package:odyssey_mobile/core/data/db/hive/models/performance.dart';
import 'package:odyssey_mobile/core/data/db/hive/models/performance_group.dart';
import 'package:odyssey_mobile/core/data/db/hive/models/sponsor.dart';
import 'package:odyssey_mobile/core/data/db/hive/models/stage.dart';
import '../../api/models/sponsor.dart';

// Adapt for multiple cities
abstract class HiveDataAdapter {
  static List<CityDataHiveModel> convertCityData({
    required CityModelApi city,
    required List<InfoModelApi> infoModels,
    required List<InfoCategoryModelApi> infoCategories,
    required List<PerformanceGroupV2ModelApi> performanceGroupsApi,
    required List<StageModelApi> stageModels,
    required Map<int, PerformanceHiveModel> performancesById,
    required Box<PerformanceHiveModel> performanceBox,
    required List<List<SponsorModelApi>> sponsors,
  }) {
    final List<CityDataHiveModel> citiesDb = [];

    citiesDb.add(
      CityDataHiveModel(
        cityId: city.id,
        cityName: city.name,
        infoGroups: _convertInfoCategories(infoCategories, infoModels),
        performanceGroups: convertPerformanceGroups(
          performanceGroupsApi: performanceGroupsApi,
          performancesById: performancesById,
          performanceBox: performanceBox,
        ),
        stages: convertStages(stageModels),
        sponsorModel: convertSponsors(sponsors),
      ),
    );

    return citiesDb;
  }

  static List<InfoGroupHiveModel> _convertInfoCategories(
    List<InfoCategoryModelApi> infoCategoryModels,
    List<InfoModelApi> infoModels,
  ) {
    final List<InfoGroupHiveModel> infoGroups = [];
    for (final infoCategory in infoCategoryModels) {
      infoGroups.add(
        InfoGroupHiveModel(
          infoCategory.id,
          infoCategory.name,
          _convertInfo(infoModels.where((e) => e.category == infoCategory.id)),
        ),
      );
    }
    return infoGroups;
  }

  static List<InfoHiveModel> _convertInfo(Iterable<InfoModelApi> apiModels) => apiModels
      .map((e) => InfoHiveModel(e.category, e.infoName, e.infoText, e.sortNumber))
      .toList();

  static List<StageHiveModel> convertStages(List<StageModelApi> apiModels) =>
      apiModels.map((e) => StageHiveModel(e.name, e.number)).toList()
        ..sort((a, b) => a.number.compareTo(b.number));

  static List<PerformanceGroupHiveModel> convertPerformanceGroups({
    required List<PerformanceGroupV2ModelApi> performanceGroupsApi,
    required Map<int, PerformanceHiveModel> performancesById,
    required Box<PerformanceHiveModel> performanceBox,
  }) {
    final List<PerformanceGroupHiveModel> performanceGroups = [];
    int groupId = 0;

    for (final apiGroup in performanceGroupsApi) {
      final linkedPerformances = apiGroup.performances
          .map((p) => performancesById[p.id])
          .whereType<PerformanceHiveModel>()
          .toList();
      if (linkedPerformances.isEmpty) continue;

      performanceGroups.add(
        PerformanceGroupHiveModel(
          groupId: groupId,
          problem: apiGroup.group.problem,
          age: apiGroup.group.age,
          stage: apiGroup.group.stage,
          part: apiGroup.group.part ?? 0,
          league: apiGroup.group.league ?? '',
          guest: apiGroup.group.guest,
          day: linkedPerformances.first.performanceDay,
          performancesHiveList: HiveList(
            performanceBox,
            objects: linkedPerformances,
          ),
        ),
      );
      ++groupId;
    }
    return performanceGroups;
  }

  static Iterable<PerformanceHiveModel> convertPerformances(
    Iterable<PerformanceModelApi> apiModels,
    List<int> previousFavIds,
  ) =>
      apiModels.map(
        (e) => PerformanceHiveModel(
          performanceId: e.id,
          age: e.age,
          part: e.part,
          performance: e.performance,
          performanceDay: e.performanceDay,
          problem: e.problem,
          spontan: e.spontan,
          spontanDay: e.spontanDay,
          league: e.league,
          stage: e.stage,
          team: e.team,
          performanceDate: _parseToDateTime(e),
          isFavourite: previousFavIds.contains(e.id),
        ),
      );

  static DateTime _parseToDateTime(PerformanceModelApi pf) {
    final parsedTime = DateFormat('HH:mm').parse(pf.performance);
    return DateTime(
      pf.performanceDate.year,
      pf.performanceDate.month,
      pf.performanceDate.day,
      parsedTime.hour,
      parsedTime.minute,
    );
  }

  static List<SponsorHiveModel> convertSponsors(List<List<SponsorModelApi>> sponsors) {
    List<SponsorHiveModel> sponsorsModelDbList = [];

    for (List<SponsorModelApi> sponsorListApi in sponsors) {
      for (SponsorModelApi s in sponsorListApi) {
        sponsorsModelDbList.add(SponsorHiveModel(s.id, s.row, s.column));
      }
    }

    return sponsorsModelDbList;
  }
}
