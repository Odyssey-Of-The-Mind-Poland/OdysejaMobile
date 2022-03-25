import 'package:flutter/material.dart';
import 'package:odyssey_mobile/app/ootm_icons.dart';
import 'package:odyssey_mobile/data/other/divisions.dart';
import 'package:odyssey_mobile/presentation/components/heading.dart';
import 'package:odyssey_mobile/presentation/helpers/snackbar_helper.dart';
import 'package:odyssey_mobile/presentation/schedule_screen/performance_category_list.dart';
import 'package:odyssey_mobile/presentation/core/city_data_builder.dart';
import 'package:odyssey_mobile/app/strings.dart';
import 'package:odyssey_mobile/app/themes.dart';

class ScheduleScreen extends StatelessWidget {
  const ScheduleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.scheduleScreenTitle),
        actions: [
          IconButton(
            onPressed: () => showSnackBar(context: context, text: AppStrings.soonImplemented),
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
