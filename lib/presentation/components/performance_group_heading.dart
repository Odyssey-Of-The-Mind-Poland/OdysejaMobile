import 'package:flutter/material.dart';
import 'package:odyssey_mobile/app/themes.dart';
import 'package:odyssey_mobile/domain/entities/performance_group.dart';
import 'package:odyssey_mobile/domain/entities/schedule_category_entity.dart';
import 'package:odyssey_mobile/presentation/components/heading.dart';
import 'package:odyssey_mobile/app/strings.dart';

class PerformanceGroupHeading extends StatelessWidget {
  const PerformanceGroupHeading(this.pfGroup, {this.categoryEntity, Key? key}) : super(key: key);
  final ScheduleCategoryEntity? categoryEntity;
  final PerformanceGroup pfGroup;

  @override
  Widget build(BuildContext context) {
    late String heading;
    if (categoryEntity != null) {
      switch (categoryEntity!.category) {
        case ScheduleCategory.stage:
          // In this case we can check for Juniors either by age or problem/
          heading = pfGroup.age != 0 ? '$_problem — $_age' : AppStrings.juniors;
          break;
        case ScheduleCategory.problem:
          heading = '$_stage — ${pfGroup.problem != 0 ? _age : AppStrings.juniors}';
          break;
        case ScheduleCategory.age:
          heading = '$_stage — ${pfGroup.age != 0 ? _problem : AppStrings.juniors}';
          break;
      }
    } else {
      heading =
          pfGroup.age != 0 ? '$_stage — $_problem — $_age' : '$_stage — ${AppStrings.juniors}';
    }
    if (pfGroup.part != 0) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Heading(heading),
          const SizedBox(width: 8.0),
          Padding(
            padding: const EdgeInsets.only(top: 16.0, bottom: 8.0),
            child: Text(
              pfGroup.part == 1 ? AppStrings.partOne : AppStrings.partTwo,
              style: AppTextStyles.h3.copyWith(color: AppColors.mediumGrey),
            ),
          )
        ],
      );
    }
    return Heading(heading);
  }

  String get _problem => '${AppStrings.problem} ${pfGroup.problem}';
  String get _age => '${AppStrings.age} ${AppStrings.divisionSymbols[pfGroup.age]}';
  String get _stage => '${AppStrings.stage} ${pfGroup.stage}';
}
