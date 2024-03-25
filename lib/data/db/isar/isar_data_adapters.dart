import 'package:odyssey_mobile/data/api/models/city.dart';
import 'package:odyssey_mobile/data/api/models/info.dart';
import 'package:odyssey_mobile/data/api/models/info_category.dart';
import 'package:odyssey_mobile/data/api/models/performance.dart';
import 'package:odyssey_mobile/data/api/models/problem.dart';
import 'package:odyssey_mobile/data/api/models/sponsor.dart';
import 'package:odyssey_mobile/data/api/models/stage.dart';
import 'package:odyssey_mobile/data/db/isar/models/city_data.dart';
import 'package:odyssey_mobile/data/db/isar/models/info.dart';
import 'package:odyssey_mobile/data/db/isar/models/info_group.dart';
import 'package:odyssey_mobile/data/db/isar/models/performance.dart';
import 'package:odyssey_mobile/data/db/isar/models/performance_group.dart';
import 'package:odyssey_mobile/data/db/isar/models/problem.dart';
import 'package:odyssey_mobile/data/db/isar/models/stage.dart';
import 'package:odyssey_mobile/domain/divisions.dart';

import 'models/sponsor.dart';

abstract class IsarDataAdapters {
  static List<ProblemModelDb> convertProblems(
          List<ProblemModelApi> apiModels) =>
      apiModels
          .map((e) => ProblemModelDb()
            ..name = e.name
            ..number = e.id)
          .toList(growable: false);

// TODO Take city into account
  static List<CityDataModelDb> convertCityData(
      {required List<CityModelApi> cityModels,
      required List<InfoModelApi> infoModels,
      required List<InfoCategoryModelApi> infoCategories,
      required List<PerformanceModelApi> performanceModels,
      required List<StageModelApi> stageModels,
      required List<ProblemModelApi> problemModels,
      required List<int> previousFavIds,
      required List<List<SponsorModelApi>> sponsors}) {
    List<CityDataModelDb> citiesDb = [];
    for (final city in cityModels) {
      final cityDb = CityDataModelDb()
        ..id = city.id
        ..cityId = city.id
        ..cityName = city.name
        ..infoIsarLinks
            .addAll(convertInfoCategories(infoCategories, infoModels))
        ..performanceGroupIsarLinks.addAll(convertPerformanceGroups(
          performances: performanceModels,
          problems: problemModels,
          stages: stageModels,
          previousFavIds: previousFavIds,
        ))
        // Sneaky mistake during refactoring led to adding stages to a getter...
        // ..stages.addAll(convertStages(stageModels));
        ..stageIsarLinks.addAll(convertStages(stageModels))
        ..sponsorIsarLinks.addAll(convertSponsors(sponsors));
      citiesDb.add(cityDb);
    }
    return citiesDb;
  }

  static List<InfoGroupModelDb> convertInfoCategories(
      List<InfoCategoryModelApi> infoCategoryModels,
      List<InfoModelApi> infoModels) {
    final List<InfoGroupModelDb> infoGroups = [];

    for (final infoCategory in infoCategoryModels) {
      final infoDbModels = convertInfo(
        infoModels.where((e) => e.category == infoCategory.id),
      );
      infoGroups.add(InfoGroupModelDb()
        ..number = infoCategory.id
        ..name = infoCategory.name
        ..infoList = infoDbModels.toList());
    }
    return infoGroups;
  }

  static Iterable<InfoModelDb> convertInfo(Iterable<InfoModelApi> apiModels) =>
      apiModels.map((e) => InfoModelDb()
        ..number = e.id
        ..infoName = e.infoName
        ..infoText = e.infoText
        ..city = e.city
        ..sortNumber = e.sortNumber);

  static List<PerformanceGroupModelDb> convertPerformanceGroups({
    required List<PerformanceModelApi> performances,
    required List<ProblemModelApi> problems,
    required List<StageModelApi> stages,
    required List<int> previousFavIds,
    // List<int> parts = const [0, 1, 2],
  }) {
    final List<PerformanceGroupModelDb> performanceGroups = [];
    final Set<String> days = performances.map((e) => e.performanceDay).toSet();
    final Set<int> parts = performances.map((e) => e.part).toSet();
    final Set<String> leagues = performances.map((e) => e.league).toSet();
    int groupId = 0;
    // I really cry when I look at it.
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
                  performanceGroups.add(PerformanceGroupModelDb()
                    ..groupId = groupId
                    ..problem = problem.id
                    ..stage = stage.number
                    ..age = division.number
                    ..part = part
                    ..league = league
                    ..performancesIsarLinks.addAll(convertPerformances(
                        filteredPerformances, previousFavIds))
                    ..day = day);
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

  static Iterable<PerformanceModelDb> convertPerformances(
          Iterable<PerformanceModelApi> apiModels, List<int> previousFavIds) =>
      apiModels.map(
        (e) => PerformanceModelDb()
          ..performanceId = e.id
          // TODO change into real value!
          ..city = 0
          ..age = e.age
          ..part = e.part
          ..league = e.league
          ..performance = e.performance
          ..performanceDay = e.performanceDay
          ..problem = e.problem
          ..spontan = e.spontan
          ..spontanDay = e.spontanDay
          ..stage = e.stage
          ..team = e.team
          ..isFavourite = previousFavIds.contains(e.id),
      );

  static List<StageModelDb> convertStages(List<StageModelApi> apiModels) =>
      apiModels
          .map((e) => StageModelDb()
            ..number = e.number
            ..name = e.name)
          .toList(growable: false);

  static List<SponsorModelDb> convertSponsors(
      List<List<SponsorModelApi>> sponsorsApi) {
    List<SponsorModelDb> sponsorsModelDbList = [];

    for (List<SponsorModelApi> sponsorListApi in sponsorsApi) {
      for (SponsorModelApi s in sponsorListApi) {
        sponsorsModelDbList.add(SponsorModelDb()
          ..sponsorId = s.id
          ..row = s.row
          ..column = s.column);
      }
    }

    return sponsorsModelDbList;
  }
}
