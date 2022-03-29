import 'package:odyssey_mobile/app/strings.dart';
import 'package:odyssey_mobile/domain/entities/performance.dart';

class CohortHelper {
  final Performance pf;

  CohortHelper(this.pf);

  List<String> get _cohort => pf.age == 0 ? [_stage, AppStrings.juniors] : [_stage, _age, _problem];
  String get _problem => '${AppStrings.problem} ${pf.problem}';
  String get _age => '${AppStrings.age} ${AppStrings.divisionSymbols[pf.age]}';
  String get _stage => '${AppStrings.stage} ${pf.stage}';

  String get string => _cohort.join(' • ');
}
