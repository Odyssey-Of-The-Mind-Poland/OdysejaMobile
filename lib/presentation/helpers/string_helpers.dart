import 'package:odyssey_mobile/core/domain/performance_group.dart';
import 'package:odyssey_mobile/core/domain/schedule_category_entity.dart';
import 'package:odyssey_mobile/l10n/strings.dart';
import 'package:odyssey_mobile/core/domain/performance.dart';

class CohortHelper {
  CohortHelper.fromPerformance(Performance performance)
      : _problem = performance.problem,
        _age = performance.age,
        _stage = performance.stage,
        _part = performance.part,
        _league = performance.league;

  CohortHelper.fromPerformanceGroup(PerformanceGroup group)
      : _problem = group.problem,
        _age = group.age,
        _stage = group.stage,
        _part = group.part,
        _league = group.league;

  final int _problem;
  final int _age;
  final int _stage;
  final int _part;
  final String _league;

  static const _separator = '•';

  // We can check for Juniors either by age or problem.
  String format([ScheduleCategoryEntity? categoryEntity]) {
    final List<String> heading = [];

    switch (categoryEntity) {
      case StageEntity():
        heading.addAll(_isJunior ? [AppStrings.juniors] : [problemString, ageString]);
        break;
      case ProblemEntity():
        heading.addAll([stageString, if (!_isJunior) ageString]);
        break;
      case DivisionEntity():
        heading.addAll([stageString, if (!_isJunior) problemString]);
        break;
      case null:
        heading.addAll(_isJunior
            ? [stageString, AppStrings.juniors]
            : [stageString, problemString, ageString]);
        break;
    }

    if (_part != 0) {
      heading.add(partString);
    }
    if (_league.isNotEmpty) {
      heading.add(leagueString);
    }
    return heading.join(' $_separator ');
  }

  // In this case we can check for Juniors either by age or problem.
  bool get _isJunior => _age == 0;

  String get problemString => '${AppStrings.problem} $_problem'.nonBreaking;
  String get ageString => '${AppStrings.age} ${AppStrings.divisionSymbols[_age]}'.nonBreaking;
  String get stageString => '${AppStrings.stage} $_stage'.nonBreaking;
  String get partString => '${AppStrings.part} $_part'.nonBreaking;
  String get leagueString => '${AppStrings.league} $_league'.nonBreaking;
}

class StringHelper {
  static String removeOrphans(String original) {
    var indexes = findSingleChars(original);
    String result = original;
    for (var index in indexes) {
      result = replaceAtIndex(index, result, '\u00A0');
    }
    return result;
  }

  static List findSingleChars(String input) {
    var indexes = [];

    for (int i = 1; i < input.length - 1; i++) {
      if (input[i - 1] == ' ' && input[i + 1] == ' ') {
        indexes.add(i);
      } else if (input[i - 1] == ' ' && input[i + 2] == ' ') {
        indexes.add(i + 1);
      }
    }

    return indexes;
  }

  static String replaceAtIndex(int index, String input, String replace) {
    return input.substring(0, index + 1) + replace + input.substring(index + 2);
  }

  static String? shortDayFormat(day) => _dayFormatConversionMap[day];

  static const _dayFormatConversionMap = {
    'sobota': AppStrings.daySaturdayShort,
    'niedziela': AppStrings.daySundayShort,
  };
}

extension StringExtension on String {
  static const int _nbsp = 0x00A0;

  String get nonBreaking => replaceAll(' ', String.fromCharCode(_nbsp));
}
