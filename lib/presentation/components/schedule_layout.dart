import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:odyssey_mobile/app/themes/themes.dart';
import 'package:odyssey_mobile/core/domain/performance_group.dart';
import 'package:odyssey_mobile/core/domain/schedule_category_entity.dart';
import 'package:odyssey_mobile/presentation/components/empty_data.dart';
import 'package:odyssey_mobile/presentation/components/favourites_list.dart';
import 'package:odyssey_mobile/presentation/components/heading.dart';
import 'package:odyssey_mobile/presentation/components/schedule_list.dart';
import 'package:odyssey_mobile/design_system/components/accent_tab_button.dart';
import 'package:odyssey_mobile/design_system/components/accent_top_bar.dart';
import 'package:odyssey_mobile/presentation/helpers/tile_style.dart';
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
    final numDays = widget.days.length;
    final entity = widget.categoryEntity;
    if (!widget.inFavourites && entity != null && numDays > 0) {
      return _buildDetail(context, entity, secretWidth);
    }
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
              .map(
                widget.inFavourites
                    ? (e) => FavouritesList(secretWidth: secretWidth, day: e)
                    : (e) => ScheduleList(
                        categoryEntity: widget.categoryEntity,
                        groups: widget.performanceGroups.where((el) => el.day == e).toList(),
                        secretWidth: secretWidth,
                      ),
              )
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
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Heading(toBeginningOfSentenceCase(widget.days.first), leftPadding: 16),
            Expanded(
              child: widget.inFavourites
                  ? FavouritesList(secretWidth: secretWidth)
                  : ScheduleList(
                      categoryEntity: widget.categoryEntity,
                      groups: widget.performanceGroups,
                      secretWidth: secretWidth,
                    ),
            ),
          ],
        ),
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

  /// Schedule of a stage, problem or age group: a collapsing header tinted like the tile the user
  /// came from, with the days as tabs inside it.
  Widget _buildDetail(BuildContext context, ScheduleCategoryEntity entity, double secretWidth) {
    final style = TileStyles.forScheduleCategory(entity);
    final multipleDays = widget.days.length > 1;

    Widget list(List<PerformanceGroup> groups) =>
        ScheduleList(categoryEntity: entity, groups: groups, secretWidth: secretWidth);

    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, _) => [
          AccentSliverTopBar(
            title: entity.title,
            subtitle: entity.name == entity.title ? null : entity.name,
            glyph: style.glyph,
            color: style.color,
            bottom: multipleDays
                ? ListenableBuilder(
                    listenable: _controller,
                    builder: (context, _) => Row(
                      spacing: 12,
                      children: [
                        for (var i = 0; i < widget.days.length; i++)
                          AccentTabButton(
                            label: toBeginningOfSentenceCase(widget.days[i]),
                            color: style.color,
                            selected: _controller.index == i,
                            onPressed: () => _controller.animateTo(i),
                          ),
                      ],
                    ),
                  )
                : null,
          ),
        ],
        body: multipleDays
            ? TabBarView(
                controller: _controller,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  for (final day in widget.days)
                    list(widget.performanceGroups.where((el) => el.day == day).toList()),
                ],
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Heading(toBeginningOfSentenceCase(widget.days.first), leftPadding: 16),
                  Expanded(child: list(widget.performanceGroups)),
                ],
              ),
      ),
    );
  }
}
