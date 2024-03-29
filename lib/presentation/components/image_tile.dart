import 'package:flutter/material.dart';
import 'package:odyssey_mobile/consts/themes.dart';

class ImageTile extends StatelessWidget {
  const ImageTile(this.id, {this.color = AppColors.pureWhite, super.key});
  final String id;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(AppValues.bigBrRadius),
          image: DecorationImage(
            image: NetworkImage('https://grzybek.snet.ovh/sponsor/$id'),
            fit: BoxFit.scaleDown,
          )),
    );
  }
}
