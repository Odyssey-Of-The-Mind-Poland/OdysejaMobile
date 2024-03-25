import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:odyssey_mobile/domain/entities/info_category.dart';
import 'package:odyssey_mobile/presentation/components/basic_box.dart';
import 'package:odyssey_mobile/consts/themes.dart';
import 'package:odyssey_mobile/presentation/router.dart';

import '../helpers/string_helpers.dart';

class InfoGrid extends StatelessWidget {
  const InfoGrid(this.infoGroup, {super.key});
  final InfoCategory infoGroup;

  @override
  Widget build(BuildContext context) {
    var sorted = infoGroup.info;
    sorted.sort((a, b) => b.sortNumber.compareTo(a.sortNumber));
    return GridView.count(
      crossAxisCount: 3,
      mainAxisSpacing: 16.0,
      crossAxisSpacing: 16.0,
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
      children: sorted
          .map((e) => BasicBox(
              onTap: () => AutoRouter.of(context).navigate(InfoDetailRoute(info: e)),
              label: StringHelper.removeOrphans(e.infoName),
              centerLabel: true,
              splashGradientPair: AppColors.safeSGPair(infoGroup.number)))
          .toList(),
    );
  }
}
