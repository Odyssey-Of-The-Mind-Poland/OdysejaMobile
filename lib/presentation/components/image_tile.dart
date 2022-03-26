import 'package:flutter/material.dart';
import 'package:odyssey_mobile/app/themes.dart';

class ImageTile extends StatelessWidget {
  const ImageTile(this.path, {Key? key}) : super(key: key);
  final String path;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(AppValues.defaultBrRadius),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Image.asset(
          path,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
