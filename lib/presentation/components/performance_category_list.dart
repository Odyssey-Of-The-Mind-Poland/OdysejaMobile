import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:odyssey_mobile/app/routing/router.dart';
import 'package:odyssey_mobile/core/domain/schedule_category_entity.dart';
import 'package:odyssey_mobile/design_system/components/schedule_tile.dart';
import 'package:odyssey_mobile/presentation/helpers/string_helpers.dart';
import 'package:odyssey_mobile/presentation/helpers/tile_style.dart';

/// Horizontal strip of tiles (stages, problems or age groups) leading to their schedules.
class PerformanceCategoryList extends StatelessWidget {
  const PerformanceCategoryList({required this.parameters, super.key});

  final List<ScheduleCategoryEntity> parameters;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: ScheduleTile.size.height,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        itemCount: parameters.length,
        itemBuilder: (context, index) {
          final entity = parameters[index];
          final style = TileStyles.forScheduleCategory(entity);
          return ScheduleTile(
            number: entity.symbol,
            title: StringHelper.removeOrphans(entity.name),
            glyph: style.glyph,
            color: style.color,
            onTap: () => context.router.navigate(ScheduleDetailRoute(categoryEntity: entity)),
          );
        },
        separatorBuilder: (context, index) => const SizedBox(width: 16.0),
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}
