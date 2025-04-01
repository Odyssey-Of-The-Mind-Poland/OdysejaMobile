import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:odyssey_mobile/core/domain/info.dart';
import 'package:odyssey_mobile/presentation/components/basic_box.dart';
import 'package:odyssey_mobile/app/themes/themes.dart';
import 'package:odyssey_mobile/app/routing/router.dart';

import '../helpers/string_helpers.dart';

class InfoGrid extends StatelessWidget {
  const InfoGrid(this.info, {super.key});
  final List<Info> info;

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 3,
      mainAxisSpacing: 16.0,
      crossAxisSpacing: 16.0,
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
      children: info
          .map((e) => BasicBox(
                onTap: () => AutoRouter.of(context).navigate(InfoDetailRoute(info: e)),
                label: StringHelper.removeOrphans(e.infoName),
                centerLabel: true,
                splashGradientPair: AppColors.safeSGPair(e.number + 2),
              ))
          .toList(),
    );
  }
}
