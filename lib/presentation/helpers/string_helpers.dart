import 'package:odyssey_mobile/l10n/strings.dart';
import 'package:odyssey_mobile/core/domain/performance.dart';

class CohortHelper {
  final Performance pf;

  CohortHelper(this.pf);

  List<String> get _cohort => pf.age == 0 ? [_stage, AppStrings.juniors] : [_stage, _age, _problem];
  String get _problem => '${AppStrings.problem} ${pf.problem}';
  String get _age => '${AppStrings.age} ${AppStrings.divisionSymbols[pf.age]}';
  String get _stage => '${AppStrings.stage} ${pf.stage}';

  String get string => _cohort.join(' • ');
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
}
