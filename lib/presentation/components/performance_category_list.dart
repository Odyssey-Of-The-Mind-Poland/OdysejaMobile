import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:odyssey_mobile/core/domain/schedule_category_entity.dart';
import 'package:odyssey_mobile/presentation/components/box_with_badge.dart';
import 'package:odyssey_mobile/app/themes/themes.dart';
import 'package:odyssey_mobile/app/routing/router.dart';

import '../helpers/string_helpers.dart';

class PerformanceCategoryList extends StatelessWidget {
  const PerformanceCategoryList({required this.parameters, this.splashGradientPair, super.key});
  final List<ScheduleCategoryEntity> parameters;
  final SplashGradientPair? splashGradientPair;
  @override
  Widget build(BuildContext context) {
    final itemList = parameters
        .map((e) => BoxWithBadge(
            badgeLabel: e.symbol,
            label: StringHelper.removeOrphans(e.name),
            onTap: () => context.router.navigate(ScheduleDetailRoute(categoryEntity: e)),
            splashGradientPair: splashGradientPair))
        .toList();
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      height: AppValues.defaultBoxDimension,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        itemCount: itemList.length,
        itemBuilder: (context, index) => itemList[index],
        separatorBuilder: (context, index) => const SizedBox(width: 16.0),
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}
