import 'package:flutter/material.dart';
import 'package:odyssey_mobile/consts/themes.dart';

class ImageTile extends StatelessWidget {
  const ImageTile(this.path, {this.color = AppColors.pureWhite, Key? key}) : super(key: key);
  final String path;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(AppValues.bigBrRadius),
          image: DecorationImage(image: AssetImage(path), fit: BoxFit.scaleDown)),
    );
  }
}
