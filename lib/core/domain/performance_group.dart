import 'package:odyssey_mobile/core/domain/performance.dart';
import 'package:odyssey_mobile/core/domain/schedule_category_entity.dart';

abstract class PerformanceGroup {
  int get groupId;
  int get problem;
  int get age;
  int get stage;
  int get part;
  String get league;

  /// Performance day
  String get day;
  List<Performance> get performances;

  PerformanceGroup copyWith({
    int? age,
    String? day,
    int? part,
    String? league,
    List<Performance>? performances,
    int? problem,
    int? stage,
  });
}

extension SortGroups on List<PerformanceGroup> {
  void sortGroups([ScheduleCategoryEntity? categoryEntity]) {
    switch (categoryEntity) {
      case StageEntity():
        sort((a, b) {
          return a.performances.first.performanceDate.compareTo(
            b.performances.first.performanceDate,
          );
        });
        break;
      case ProblemEntity():
        sort((a, b) {
          final ageComparison = a.age.compareTo(b.age);
          if (ageComparison != 0) {
            return ageComparison;
          }

          final partComparison = a.part.compareTo(b.part);
          if (partComparison != 0) {
            return partComparison;
          }

          final leagueComparison = a.league.compareTo(b.league);
          if (leagueComparison != 0) {
            return leagueComparison;
          }

          final stageComparison = a.stage.compareTo(b.stage);
          return stageComparison;
        });
      case DivisionEntity():
        sort((a, b) {
          final problemComparison = a.problem.compareTo(b.problem);
          if (problemComparison != 0) {
            return problemComparison;
          }

          final partComparison = a.part.compareTo(b.part);
          if (partComparison != 0) {
            return partComparison;
          }

          final leagueComparison = a.league.compareTo(b.league);
          if (leagueComparison != 0) {
            return leagueComparison;
          }

          final stageComparison = a.stage.compareTo(b.stage);
          return stageComparison;
        });
      case null:
        sort((a, b) {
          final timeComparison =
              a.performances.first.performanceDate.compareTo(b.performances.first.performanceDate);
          if (timeComparison != 0) {
            return timeComparison;
          }

          final problemComparison = a.problem.compareTo(b.problem);
          if (problemComparison != 0) {
            return problemComparison;
          }

          final ageComparison = a.age.compareTo(b.age);
          if (ageComparison != 0) {
            return ageComparison;
          }

          final partComparison = a.part.compareTo(b.part);
          if (partComparison != 0) {
            return partComparison;
          }

          final leagueComparison = a.league.compareTo(b.league);
          if (leagueComparison != 0) {
            return leagueComparison;
          }

          final stageComparison = a.stage.compareTo(b.stage);
          return stageComparison;
        });
        break;
    }
  }
}
