import 'package:flutter/material.dart';

import 'package:odyssey_mobile/consts/themes.dart';
import 'package:odyssey_mobile/domain/entities/performance_group.dart';
import 'package:odyssey_mobile/domain/entities/schedule_category_entity.dart';
import 'package:odyssey_mobile/presentation/components/empty_data.dart';
import 'package:odyssey_mobile/presentation/components/favourites_list.dart';
import 'package:odyssey_mobile/presentation/components/heading.dart';
import 'package:odyssey_mobile/presentation/components/schedule_list.dart';

class ScheduleLayout extends StatefulWidget {
  const ScheduleLayout({
    super.key,
    required this.days,
    required this.performanceGroups,
    required this.title,
    this.centerTitle = true,
    this.categoryEntity,
    this.actions = const [],
    this.inFavourites = false,
    this.emptyWidget = const EmptyData(),
  });

  final bool centerTitle;
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

class _ScheduleLayoutState extends State<ScheduleLayout> with SingleTickerProviderStateMixin {
  static int _initialIndex = 0;

  late final TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TabController(
      length: widget.days.length,
      vsync: this,
      initialIndex: widget.days.length > 1 ? _initialIndex : 0,
    );
    _controller.addListener(() => _initialIndex = _controller.index);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final secretWidth = MediaQuery.of(context).size.width * AppValues.swipeTreshold - 24;
    // TODO convert into CustomScrollView and slivers?
    final numDays = widget.days.length;
    if (numDays > 1) {
      return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          centerTitle: widget.centerTitle,
          actions: widget.actions,
          bottom: TabBar(
            controller: _controller,
            tabs: widget.days.map((e) => Text(e)).toList(),
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
        appBar: AppBar(
          title: Text(widget.title),
          centerTitle: widget.centerTitle,
          actions: widget.actions,
        ),
        body: Column(children: [
          Heading(widget.days.first),
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
        appBar: AppBar(
          title: Text(widget.title),
          centerTitle: widget.centerTitle,
          actions: widget.actions,
        ),
        body: widget.emptyWidget,
      );
    }
  }
}
