import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:odyssey_mobile/app/themes/themes.dart';
import 'package:odyssey_mobile/core/data/failures.dart';
import 'package:odyssey_mobile/core/domain/performance.dart';
import 'package:odyssey_mobile/l10n/strings.dart';
import 'package:odyssey_mobile/presentation/components/city_data_builder.dart';
import 'package:odyssey_mobile/presentation/components/error_body.dart';
import 'package:odyssey_mobile/presentation/components/heading.dart';
import 'package:odyssey_mobile/presentation/components/highlighted_performance_card.dart';
import 'package:odyssey_mobile/presentation/components/performance_card.dart';
import 'package:odyssey_mobile/presentation/components/performance_group_heading.dart';
import 'package:odyssey_mobile/widgets/top_bar.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

@RoutePage()
class ScheduleSearchResultScreen extends StatefulWidget {
  const ScheduleSearchResultScreen(this.performance, {super.key});
  final Performance performance;

  @override
  State<ScheduleSearchResultScreen> createState() => _ScheduleSearchResultScreenState();
}

class _ScheduleSearchResultScreenState extends State<ScheduleSearchResultScreen> {
  final ItemScrollController itemScrollController = ItemScrollController();
  int? length;
  int? index;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final safeIndex = index ?? 0;
      final safeLength = length ?? 10;
      final height = MediaQuery.of(context).size.height - 300;
      // 72 pixels per tile, doubled
      final int assessedNumItems = (height / 72).ceil();
      if (safeIndex > (height / 144).floor() && safeLength >= assessedNumItems) {
        Future.delayed(
            const Duration(milliseconds: 100),
            () => itemScrollController.scrollTo(
                index: index ?? 0,
                duration: const Duration(seconds: 1),
                curve: Curves.easeInOutCubic,
                alignment: 0.5));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final secretWidth = MediaQuery.of(context).size.width * AppValues.swipeTreshold - 24;
    return Scaffold(
        appBar: TopBar.backAction(title: AppStrings.scheduleSearchResultTitle),
        body: CityDataBuilder(onData: (cityData, _) {
          final groupIndex = cityData.performanceGroups.indexWhere((e) =>
              e.age == widget.performance.age &&
              e.stage == widget.performance.stage &&
              e.problem == widget.performance.problem &&
              e.part == widget.performance.part);
          if (groupIndex > -1) {
            final group = cityData.performanceGroups[groupIndex];
            index = group.performances
                .indexWhere((e) => e.performanceId == widget.performance.performanceId);
            length = group.performances.length;
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Heading(toBeginningOfSentenceCase(widget.performance.performanceDay)),
                  PerformanceGroupHeading(group, categoryEntity: null),
                  Expanded(
                    child: ScrollablePositionedList.separated(
                      separatorBuilder: (context, _) => const SizedBox(height: 16),
                      itemScrollController: itemScrollController,
                      itemCount: length!,
                      itemBuilder: (context, i) => i == index
                          ? HighlightedPerformanceCard(
                              performance: group.performances[i],
                              secretWidth: secretWidth,
                            )
                          : PerformanceCard(
                              performance: group.performances[i],
                              secretWidth: secretWidth,
                            ),
                    ),
                  ),
                ],
              ),
            );
          } else {
            return const ErrorBody(UnknownFailure());
          }
        }));
  }
}
