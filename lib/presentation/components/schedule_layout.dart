import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:odyssey_mobile/app/themes/themes.dart';
import 'package:odyssey_mobile/core/domain/performance_group.dart';
import 'package:odyssey_mobile/core/domain/schedule_category_entity.dart';
import 'package:odyssey_mobile/presentation/components/empty_data.dart';
import 'package:odyssey_mobile/presentation/components/favourites_list.dart';
import 'package:odyssey_mobile/presentation/components/heading.dart';
import 'package:odyssey_mobile/presentation/components/schedule_list.dart';
import 'package:odyssey_mobile/widgets/top_bar.dart';

class ScheduleLayout extends StatefulWidget {
  const ScheduleLayout({
    super.key,
    required this.days,
    required this.performanceGroups,
    required this.title,
    this.categoryEntity,
    this.actions = const [],
    this.inFavourites = false,
    this.emptyWidget = const EmptyData(),
  });

  final String title;
  final List<String> days;
  final List<Widget> actions;
  final List<PerformanceGroup> performanceGroups;
  final ScheduleCategoryEntity? categoryEntity;
  final bool inFavourites;
  final Widget emptyWidget;

  @override
  State<ScheduleLayout> createState() => _ScheduleLayoutState();
}

class _ScheduleLayoutState extends State<ScheduleLayout> with TickerProviderStateMixin {
  static int _initialIndex = 0;

  late TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = _createController();
  }

  @override
  void didUpdateWidget(covariant ScheduleLayout oldWidget) {
    super.didUpdateWidget(oldWidget);
    _controller.dispose();
    _controller = _createController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  TabController _createController() {
    final controller = TabController(
      length: widget.days.length,
      vsync: this,
      initialIndex: widget.days.length > 1 ? _initialIndex : 0,
    );
    controller.addListener(() => _initialIndex = controller.index);
    return controller;
  }

  @override
  Widget build(BuildContext context) {
    final secretWidth = MediaQuery.of(context).size.width * AppValues.swipeTreshold - 24;
    // TODO convert into CustomScrollView and slivers?
    final numDays = widget.days.length;
    if (numDays > 1) {
      return Scaffold(
        appBar: TopBar(
          title: widget.title,
          actions: widget.actions,
          leading: widget.inFavourites ? null : BackAction(),
          bottom: TabBar(
            controller: _controller,
            tabs: widget.days.map((e) => Text(toBeginningOfSentenceCase(e))).toList(),
          ),
        ),
        body: TabBarView(
          controller: _controller,
          physics: const NeverScrollableScrollPhysics(),
          children: widget.days
              .map(widget.inFavourites
                  ? (e) => FavouritesList(secretWidth: secretWidth, day: e)
                  : (e) => ScheduleList(
                        categoryEntity: widget.categoryEntity,
                        groups: widget.performanceGroups.where((el) => el.day == e).toList(),
                        secretWidth: secretWidth,
                      ))
              .toList(),
        ),
      );
    } else if (numDays == 1) {
      return Scaffold(
        appBar: TopBar(
          title: widget.title,
          actions: widget.actions,
          leading: widget.inFavourites ? null : BackAction(),
        ),
        body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Heading(toBeginningOfSentenceCase(widget.days.first), leftPadding: 16),
          Expanded(
            child: widget.inFavourites
                ? FavouritesList(secretWidth: secretWidth)
                : ScheduleList(
                    categoryEntity: widget.categoryEntity,
                    groups: widget.performanceGroups,
                    secretWidth: secretWidth),
          ),
        ]),
      );
    } else {
      return Scaffold(
        appBar: TopBar(
          title: widget.title,
          actions: widget.actions,
          leading: widget.inFavourites ? null : BackAction(),
        ),
        body: widget.emptyWidget,
      );
    }
  }
}
