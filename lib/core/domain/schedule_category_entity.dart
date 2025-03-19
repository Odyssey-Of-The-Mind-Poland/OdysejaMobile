import 'package:odyssey_mobile/l10n/strings.dart';

sealed class ScheduleCategoryEntity {
  /// Used for labels on category tiles on [ScheduleScreen].

  String get name;

  /// Mainly internal, can be used for sorting.
  int get number;

  /// Displayed on a badge on category tiles on [ScheduleScreen].
  String get symbol;

  /// Used for page titles on [ScheduleDetailScreen].
  String get title;
}

abstract class StageEntity implements ScheduleCategoryEntity {
  @override
  String get symbol => '$number';

  @override
  String get title => '${AppStrings.stage} $symbol';
}

abstract class ProblemEntity implements ScheduleCategoryEntity {
  @override
  String get symbol => number > 0 ? '$number' : 'J';

  @override
  String get title => number > 0 ? '${AppStrings.problem} $symbol' : AppStrings.juniorProblem;
}

abstract class DivisionEntity implements ScheduleCategoryEntity {}
