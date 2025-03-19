import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:odyssey_mobile/app/themes/themes.dart';

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
          imageUrl: 'https://grzybek.snet.ovh/sponsor/$id',
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
