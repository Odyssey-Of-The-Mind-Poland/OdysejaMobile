import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:odyssey_mobile/app/routing/router.dart';
import 'package:odyssey_mobile/core/domain/divisions.dart';
import 'package:odyssey_mobile/design_system/components/search_bar_button.dart';
import 'package:odyssey_mobile/l10n/strings.dart';
import 'package:odyssey_mobile/presentation/components/city_data_builder.dart';
import 'package:odyssey_mobile/presentation/components/heading.dart';
import 'package:odyssey_mobile/presentation/components/performance_category_list.dart';
import 'package:odyssey_mobile/widgets/top_bar.dart';

@RoutePage()
class ScheduleScreen extends StatelessWidget {
  const ScheduleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopBar(title: AppStrings.scheduleScreenTitle),
      body: CityDataBuilder(
        onData: (cityData, problems) => ListView(
          padding: const EdgeInsets.only(top: 16, bottom: 24),
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: SearchBarButton(
                hint: AppStrings.scheduleSearchHint,
                onTap: () => context.router.push(const ScheduleSearchRoute()),
              ),
            ),
            const Heading(AppStrings.scheduleScreenStageHeading, leftPadding: 16),
            PerformanceCategoryList(parameters: cityData.stages.toList()),
            const Heading(AppStrings.scheduleScreenProblemHeading, leftPadding: 16),
            // TODO Check [data] for unavailable problems
            PerformanceCategoryList(parameters: problems),
            const Heading(AppStrings.scheduleScreenDivisionHeading, leftPadding: 16),
            // TODO Check [data] for unavailable divisions
            const PerformanceCategoryList(parameters: divisions),
          ],
        ),
      ),
    );
  }
}
