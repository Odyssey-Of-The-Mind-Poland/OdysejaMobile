import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:odyssey_mobile/core/ootm_icons.dart';
import 'package:odyssey_mobile/domain/divisions.dart';
import 'package:odyssey_mobile/presentation/components/city_data_builder.dart';
import 'package:odyssey_mobile/presentation/components/heading.dart';
import 'package:odyssey_mobile/presentation/components/performance_category_list.dart';
import 'package:odyssey_mobile/consts/strings.dart';
import 'package:odyssey_mobile/consts/themes.dart';
import 'package:odyssey_mobile/presentation/router.dart';

@RoutePage()
class ScheduleScreen extends StatelessWidget {
  const ScheduleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.scheduleScreenTitle),
        actions: [
          IconButton(
            padding: const EdgeInsets.all(18),
            onPressed: () => context.router.push(const ScheduleSearchRoute()),
            icon: const Icon(OotmIcons.search),
          )
        ],
      ),
      body: CityDataBuilder(
        onData: (cityData, problems) => ListView(
          children: [
            const Heading(AppStrings.scheduleScreenStageHeading, leftPadding: 16),
            PerformanceCategoryList(
              parameters: cityData.stages.toList(),
              splashGradientPair: AppColors.sGPair(3),
            ),
            const Heading(AppStrings.scheduleScreenProblemHeading, leftPadding: 16),
            // TODO Check [data] for unavailable problems
            PerformanceCategoryList(
              parameters: problems,
              splashGradientPair: AppColors.sGPair(4),
            ),
            const Heading(AppStrings.scheduleScreenDivisionHeading, leftPadding: 16),
            // TODO Check [data] for unavailable divisions
            PerformanceCategoryList(
              parameters: divisions,
              splashGradientPair: AppColors.sGPair(5),
            ),
          ],
        ),
      ),
    );
  }
}
