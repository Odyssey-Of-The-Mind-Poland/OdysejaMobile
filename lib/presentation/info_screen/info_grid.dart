import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:odyssey_mobile/app/routing/router.dart';
import 'package:odyssey_mobile/core/domain/info.dart';
import 'package:odyssey_mobile/design_system/components/info_tile.dart';
import 'package:odyssey_mobile/presentation/helpers/string_helpers.dart';
import 'package:odyssey_mobile/presentation/helpers/tile_style.dart';

class InfoGrid extends StatelessWidget {
  const InfoGrid(this.info, {super.key});
  final List<Info> info;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 12,
        crossAxisSpacing: 12,
        mainAxisExtent: 80,
      ),
      itemCount: info.length,
      itemBuilder: (context, index) {
        final item = info[index];
        final style = TileStyles.forInfo(item, position: index);
        return InfoTile(
          title: StringHelper.removeOrphans(item.infoName),
          glyph: style.glyph,
          color: style.color,
          onTap: () => AutoRouter.of(context).navigate(InfoDetailRoute(info: item)),
        );
      },
    );
  }
}
