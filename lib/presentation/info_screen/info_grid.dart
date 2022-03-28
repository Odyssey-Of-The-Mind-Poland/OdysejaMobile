import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:odyssey_mobile/domain/entities/info_category.dart';
import 'package:odyssey_mobile/presentation/components/basic_box.dart';
import 'package:odyssey_mobile/app/router.dart';
import 'package:odyssey_mobile/app/themes.dart';

class InfoGrid extends StatelessWidget {
  const InfoGrid(this.infoGroup, {Key? key}) : super(key: key);
  final InfoCategory infoGroup;

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 3,
      mainAxisSpacing: 16.0,
      crossAxisSpacing: 16.0,
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
      children: infoGroup.info
          .map((e) => BasicBox(
              onTap: () => AutoRouter.of(context).navigate(InfoDetailScreen(info: e)),
              label: e.infoName,
              centerLabel: true,
              splashGradientPair: AppColors.safeSGPair(infoGroup.number)))
          .toList(),
    );
  }
}
