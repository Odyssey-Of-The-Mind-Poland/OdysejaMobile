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

  /// Kebab-case name of the icon chosen by the editors; null falls back to the default of the kind.
  String? get icon;

  /// Accent colour key chosen by the editors (`blue`, `orange`...); null falls back to a colour by [number].
  String? get color;
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
