import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:odyssey_mobile/app/injectable.dart';
import 'package:odyssey_mobile/app/themes/themes.dart';
import 'package:odyssey_mobile/config/env_config.dart';

class ImageTile extends StatelessWidget {
  const ImageTile(this.id, {this.color = AppColors.pureWhite, super.key});
  final int id;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(AppValues.bigBrRadius),
      child: DecoratedBox(
        decoration: BoxDecoration(color: color),
        child: CachedNetworkImage(
          imageUrl: '${sl<EnvConfig>().baseUrl}/sponsor/$id',
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
