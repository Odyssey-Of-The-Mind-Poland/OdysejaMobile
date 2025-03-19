import 'package:flutter/material.dart';
import 'package:odyssey_mobile/core/domain/performance_group.dart';
import 'package:odyssey_mobile/core/domain/schedule_category_entity.dart';
import 'package:odyssey_mobile/presentation/components/heading.dart';
import 'package:odyssey_mobile/l10n/strings.dart';

class PerformanceGroupHeading extends StatelessWidget {
  const PerformanceGroupHeading(this.pfGroup, {this.categoryEntity, super.key});
  final ScheduleCategoryEntity? categoryEntity;
  final PerformanceGroup pfGroup;

  static const _separator = '•';

  @override
  Widget build(BuildContext context) {
    final List<String> heading = [];
    if (categoryEntity != null) {
      switch (categoryEntity!) {
        case StageEntity():
          // In this case we can check for Juniors either by age or problem.
          heading.addAll(pfGroup.age != 0 ? [_problem, _age] : [AppStrings.juniors]);
          break;
        case ProblemEntity():
          heading.addAll([_stage, if (pfGroup.problem != 0) _age]);
          break;
        case DivisionEntity():
          heading.addAll([_stage, if (pfGroup.age != 0) _problem]);
          break;
      }
    } else {
      heading.addAll(pfGroup.age != 0 ? [_stage, _problem, _age] : [_stage, AppStrings.juniors]);
    }
    if (pfGroup.part != 0) {
      heading.add(_part);
    }
    if (pfGroup.league.isNotEmpty) {
      heading.add(_league);
    }
    return Heading(heading.join(' $_separator '));
  }

  String get _problem => '${AppStrings.problem} ${pfGroup.problem}'.nonBreaking;
  String get _age => '${AppStrings.age} ${AppStrings.divisionSymbols[pfGroup.age]}'.nonBreaking;
  String get _stage => '${AppStrings.stage} ${pfGroup.stage}'.nonBreaking;
  String get _part => '${AppStrings.part} ${pfGroup.part}'.nonBreaking;
  String get _league => '${AppStrings.league} ${pfGroup.league}'.nonBreaking;
}
