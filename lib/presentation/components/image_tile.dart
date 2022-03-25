import 'package:flutter/material.dart';
import 'package:odyssey_mobile/app/themes.dart';

class ImageTile extends StatelessWidget {
  const ImageTile(this.path, {Key? key}) : super(key: key);
  final String path;
  @override
  Widget build(BuildContext context) {
    return Image.asset(
      path,
      fit: BoxFit.cover,
      frameBuilder: (BuildContext context, Widget child, int? frame, bool wasSynchronouslyLoaded) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(AppValues.defaultBrRadius),
          child: child,
        );
      },
      errorBuilder: (context, error, stacktrace) => Container(
          decoration: BoxDecoration(
        color: AppColors.darkestGrey,
        borderRadius: BorderRadius.circular(AppValues.defaultBrRadius),
      )),
    );
  }
}
