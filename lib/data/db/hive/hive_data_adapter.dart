import 'package:hive_flutter/hive_flutter.dart';
import 'package:odyssey_mobile/data/api/models/city.dart';
import 'package:odyssey_mobile/data/api/models/info.dart';
import 'package:odyssey_mobile/data/api/models/info_category.dart';
import 'package:odyssey_mobile/data/api/models/performance.dart';
import 'package:odyssey_mobile/data/api/models/problem.dart';
import 'package:odyssey_mobile/data/api/models/stage.dart';
import 'package:odyssey_mobile/data/db/hive/models/city_data.dart';
import 'package:odyssey_mobile/data/db/hive/models/info.dart';
import 'package:odyssey_mobile/data/db/hive/models/info_group.dart';
import 'package:odyssey_mobile/data/db/hive/models/performance.dart';
import 'package:odyssey_mobile/data/db/hive/models/performance_group.dart';
import 'package:odyssey_mobile/data/db/hive/models/sponsor.dart';
import 'package:odyssey_mobile/data/db/hive/models/stage.dart';
import 'package:odyssey_mobile/domain/divisions.dart';

import '../../api/models/sponsor.dart';

// Adapt for multiple cities
abstract class HiveDataAdapter {
  static List<CityDataHiveModel> convertCityData(
      {required List<CityModelApi> cityModels,
      required List<InfoModelApi> infoModels,
      required List<InfoCategoryModelApi> infoCategories,
      required List<PerformanceHiveModel> performanceModels,
      required List<StageModelApi> stageModels,
      required List<ProblemModelApi> problemModels,
      required List<int> previousFavIds,
      required Box<PerformanceHiveModel> performanceBox,
      required List<List<SponsorModelApi>> sponsors}) {
    final List<CityDataHiveModel> citiesDb = [];
    for (final city in cityModels) {
      citiesDb.add(CityDataHiveModel(
          cityId: city.id,
          cityName: city.name,
          infoGroups: _convertInfoCategories(infoCategories, infoModels),
          performanceGroups: convertPerformanceGroups(
              performances: performanceModels,
              problems: problemModels,
              stages: stageModels,
              previousFavIds: previousFavIds,
              performanceBox: performanceBox),
          stages: convertStages(stageModels),
          sponsorModel: convertSponsors(sponsors)));
    }
    return citiesDb;
  }

  static List<InfoGroupHiveModel> _convertInfoCategories(
      List<InfoCategoryModelApi> infoCategoryModels,
      List<InfoModelApi> infoModels) {
    final List<InfoGroupHiveModel> infoGroups = [];
    for (final infoCategory in infoCategoryModels) {
      infoGroups.add(InfoGroupHiveModel(
          infoCategory.id,
          infoCategory.name,
          _convertInfo(
              infoModels.where((e) => e.category == infoCategory.id))));
    }
    return infoGroups;
  }

  static List<InfoHiveModel> _convertInfo(Iterable<InfoModelApi> apiModels) =>
      apiModels
          .map((e) =>
              InfoHiveModel(e.category, e.infoName, e.infoText, e.sortNumber))
          .toList();

  static List<StageHiveModel> convertStages(List<StageModelApi> apiModels) =>
      apiModels.map((e) => StageHiveModel(e.name, e.number)).toList();

  static List<PerformanceGroupHiveModel> convertPerformanceGroups({
    required List<PerformanceHiveModel> performances,
    required List<ProblemModelApi> problems,
    required List<StageModelApi> stages,
    required List<int> previousFavIds,
    required Box<PerformanceHiveModel> performanceBox,
  }) {
    final List<PerformanceGroupHiveModel> performanceGroups = [];
    final Set<String> days = performances.map((e) => e.performanceDay).toSet();
    final Set<int> parts = performances.map((e) => e.part).toSet();
    final Set<String> leagues = performances.map((e) => e.league).toSet();
    int groupId = 0;
    // I cry when I look at it.
    for (final stage in stages) {
      for (final problem in problems) {
        for (final division in divisions) {
          for (final part in parts) {
            for (final league in leagues) {
              for (final day in days) {
                final filteredPerformances = performances.where((e) =>
                    e.problem == problem.id &&
                    e.stage == stage.number &&
                    e.age == division.number &&
                    e.part == part &&
                    e.league == league &&
                    e.performanceDay == day);
                if (filteredPerformances.isNotEmpty) {
                  performanceGroups.add(PerformanceGroupHiveModel(
                      groupId: groupId,
                      problem: problem.id,
                      age: division.number,
                      stage: stage.number,
                      part: part,
                      league: league,
                      day: day,
                      performancesHiveList: HiveList(performanceBox,
                          objects: filteredPerformances.toList())));
                  ++groupId;
                }
              }
            }
          }
        }
      }
    }
    return performanceGroups;
  }

  static Iterable<PerformanceHiveModel> convertPerformances(
          Iterable<PerformanceModelApi> apiModels, List<int> previousFavIds) =>
      apiModels.map((e) => PerformanceHiveModel(
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
          performanceDate: e.performanceDate,
          isFavourite: previousFavIds.contains(e.id)));

  static List<SponsorHiveModel> convertSponsors(
      List<List<SponsorModelApi>> sponsors) {
    List<SponsorHiveModel> sponsorsModelDbList = [];

    for (List<SponsorModelApi> sponsorListApi in sponsors) {
      for (SponsorModelApi s in sponsorListApi) {
        sponsorsModelDbList.add(SponsorHiveModel(s.id, s.row, s.column));
      }
    }

    return sponsorsModelDbList;
  }
}
