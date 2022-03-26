import 'package:flutter/material.dart';

import 'package:odyssey_mobile/app/themes.dart';
import 'package:odyssey_mobile/domain/entities/performance_group.dart';
import 'package:odyssey_mobile/domain/entities/schedule_category_entity.dart';
import 'package:odyssey_mobile/presentation/components/heading.dart';
import 'package:odyssey_mobile/presentation/components/schedule_list.dart';

class ScheduleLayout extends StatelessWidget {
  const ScheduleLayout({
    Key? key,
    required this.days,
    required this.performanceGroups,
    required this.categoryEntity,
  }) : super(key: key);

  final List<String> days;
  final List<PerformanceGroup> performanceGroups;
  final ScheduleCategoryEntity categoryEntity;

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
            title: Text(categoryEntity.title),
            centerTitle: true,
            bottom: TabBar(tabs: days.map((e) => Text(e)).toList()),
          ),
          body: TabBarView(
              physics: const NeverScrollableScrollPhysics(),
              children: days
                  .map((e) => ScheduleList(
                        categoryEntity: categoryEntity,
                        groups: performanceGroups.where((el) => el.day == e).toList(),
                        secretWidth: secretWidth,
                      ))
                  .toList()),
        ),
      );
    } else {
      return Scaffold(
          appBar: AppBar(
            title: Text(categoryEntity.title),
            centerTitle: true,
          ),
          body: Column(
            children: [
              Heading(days.first),
              Expanded(
                child: ScheduleList(
                  categoryEntity: categoryEntity,
                  groups: performanceGroups,
                  secretWidth: secretWidth,
                ),
              ),
            ],
          ));
    }
  }
}
