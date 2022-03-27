import 'package:flutter/material.dart';

import 'package:odyssey_mobile/app/themes.dart';
import 'package:odyssey_mobile/domain/entities/performance_group.dart';
import 'package:odyssey_mobile/domain/entities/schedule_category_entity.dart';
import 'package:odyssey_mobile/presentation/components/favourites_list.dart';
import 'package:odyssey_mobile/presentation/components/heading.dart';
import 'package:odyssey_mobile/presentation/components/schedule_list.dart';

class ScheduleLayout extends StatelessWidget {
  const ScheduleLayout({
    Key? key,
    required this.days,
    required this.performanceGroups,
    required this.title,
    this.centerTitle = true,
    this.categoryEntity,
    this.actions = const [],
    this.inFavourites = false,
  }) : super(key: key);

  final bool centerTitle;
  final String title;
  final List<String> days;
  final List<Widget> actions;
  final List<PerformanceGroup> performanceGroups;
  final ScheduleCategoryEntity? categoryEntity;
  final bool inFavourites;

  @override
  Widget build(BuildContext context) {
    final secretWidth = MediaQuery.of(context).size.width * AppValues.swipeTreshold - 24;
    // TODO convert into CustomScrollView and slivers?
    final numDays = days.length;
    if (numDays > 1) {
      return DefaultTabController(
        length: numDays,
        child: Scaffold(
          appBar: AppBar(
            title: Text(title),
            centerTitle: centerTitle,
            actions: actions,
            bottom: TabBar(tabs: days.map((e) => Text(e)).toList()),
          ),
          body: TabBarView(
              physics: const NeverScrollableScrollPhysics(),
              children: days
                  .map(inFavourites
                      ? (e) => FavouritesList(secretWidth: secretWidth, day: e)
                      : (e) => ScheduleList(
                            categoryEntity: categoryEntity,
                            groups: performanceGroups.where((el) => el.day == e).toList(),
                            secretWidth: secretWidth,
                          ))
                  .toList()),
        ),
      );
    } else if (numDays == 1) {
      return Scaffold(
          appBar: AppBar(
            title: Text(title),
            centerTitle: centerTitle,
            actions: actions,
          ),
          body: Column(
            children: [
              Heading(days.first),
              Expanded(
                child: inFavourites
                    ? FavouritesList(secretWidth: secretWidth)
                    : ScheduleList(
                        categoryEntity: categoryEntity,
                        groups: performanceGroups,
                        secretWidth: secretWidth),
              ),
            ],
          ));
    } else {
      return Scaffold(
        appBar: AppBar(
          title: Text(title),
          centerTitle: centerTitle,
          actions: actions,
        ),
      );
    }
  }
}
