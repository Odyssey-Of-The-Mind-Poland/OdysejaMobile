import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:odyssey_mobile/app/injectable.dart';
import 'package:odyssey_mobile/app/themes/theme.dart';
import 'package:odyssey_mobile/config/env_config.dart';
import 'package:odyssey_mobile/config/ootm_icons.dart';

class ImageTile extends StatelessWidget {
  const ImageTile(this.id, {super.key});
  final int id;

  static const _fallbackBorderColor = Colors.black;
  static const _borderRadius = 16.0;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<OotmCommonTheme>();
    return DecoratedBox(
      position: DecorationPosition.foreground,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(_borderRadius),
        border: Border.all(width: 2, color: theme?.borderColor ?? _fallbackBorderColor),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(_borderRadius),
        child: CachedNetworkImage(
          errorWidget: (context, url, error) => DecoratedBox(
            decoration: BoxDecoration(color: theme?.surfaceColor),
            child: Icon(OotmIcons.close, size: 24),
          ),
          imageUrl: '${sl<EnvConfig>().baseUrl}/sponsor/$id',
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
