import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:odyssey_mobile/app/ootm_icons.dart';
import 'package:odyssey_mobile/app/themes.dart';
import 'package:odyssey_mobile/domain/core/failures.dart';
import 'package:odyssey_mobile/domain/entities/performance.dart';
import 'package:odyssey_mobile/presentation/components/heading.dart';
import 'package:odyssey_mobile/presentation/components/highlighted_performance_card.dart';
import 'package:odyssey_mobile/presentation/components/performance_card.dart';
import 'package:odyssey_mobile/presentation/components/performance_group_heading.dart';
import 'package:odyssey_mobile/presentation/core/city_data_builder.dart';
import 'package:odyssey_mobile/presentation/core/error_body.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class ScheduleSearchResultScreen extends StatefulWidget {
  const ScheduleSearchResultScreen(this.performance, {Key? key}) : super(key: key);
  final Performance performance;

  @override
  State<ScheduleSearchResultScreen> createState() => _ScheduleSearchResultScreenState();
}

class _ScheduleSearchResultScreenState extends State<ScheduleSearchResultScreen> {
  final ItemScrollController itemScrollController = ItemScrollController();

  int? index;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((_) => Future.delayed(
        const Duration(milliseconds: 100),
        () => itemScrollController.scrollTo(
            index: index ?? 0,
            duration: const Duration(seconds: 1),
            curve: Curves.easeInOutCubic,
            alignment: 0.5)));
  }

  @override
  Widget build(BuildContext context) {
    final secretWidth = MediaQuery.of(context).size.width * AppValues.swipeTreshold - 24;
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Wyszukano'),
          actions: [
            IconButton(
              onPressed: context.router.popUntilRoot,
              icon: const Icon(OotmIcons.close),
            )
          ],
        ),
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
            return Column(
              children: [
                Heading(widget.performance.performanceDay),
                PerformanceGroupHeading(group, categoryEntity: null),
                Expanded(
                  child: ScrollablePositionedList.builder(
                    itemScrollController: itemScrollController,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    itemCount: group.performances.length,
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
            );
          } else {
            return const ErrorBody(UnknownFailure());
          }
        }));
  }
}