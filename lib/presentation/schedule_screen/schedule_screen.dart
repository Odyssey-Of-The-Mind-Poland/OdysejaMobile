import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:odyssey_mobile/app/routing/router.dart';
import 'package:odyssey_mobile/config/ootm_icons.dart';
import 'package:odyssey_mobile/core/domain/divisions.dart';
import 'package:odyssey_mobile/design_system/components/search_bar_button.dart';
import 'package:odyssey_mobile/l10n/strings.dart';
import 'package:odyssey_mobile/presentation/components/city_data_builder.dart';
import 'package:odyssey_mobile/presentation/components/heading.dart';
import 'package:odyssey_mobile/presentation/components/performance_category_list.dart';
import 'package:odyssey_mobile/widgets/top_bar.dart';

@RoutePage()
class ScheduleScreen extends StatefulWidget {
  const ScheduleScreen({super.key});

  @override
  State<ScheduleScreen> createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<ScheduleScreen> {
  /// The search field stays hidden behind the magnifier in the top bar until it is tapped.
  bool _searchVisible = false;

  Future<void> _openSearch() async {
    await context.router.push(const ScheduleSearchRoute());
    if (mounted) setState(() => _searchVisible = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopBar(
        title: AppStrings.scheduleScreenTitle,
        actions: [
          if (!_searchVisible)
            TopBarAction(
              iconData: OotmIcons.search,
              onPressed: () => setState(() => _searchVisible = true),
            ),
        ],
      ),
      body: CityDataBuilder(
        onData: (cityData, problems) => ListView(
          padding: const EdgeInsets.only(top: 16, bottom: 24),
          children: [
            AnimatedSize(
              duration: const Duration(milliseconds: 200),
              curve: Curves.easeOut,
              alignment: Alignment.topCenter,
              child: _searchVisible
                  ? Padding(
                      padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
                      child: SearchBarButton(
                        hint: AppStrings.scheduleSearchHint,
                        onTap: _openSearch,
                      ),
                    )
                  : const SizedBox(width: double.infinity),
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
