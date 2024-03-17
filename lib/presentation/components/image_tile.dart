import 'package:flutter/material.dart';
import 'package:odyssey_mobile/app/themes.dart';

class ImageTile extends StatelessWidget {
  const ImageTile(this.id, {this.color = AppColors.pureWhite, Key? key}) : super(key: key);
  final String id;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(AppValues.bigBrRadius),
          image: DecorationImage(image: NetworkImage('http://grzybek.snet.ovh:8082/sponsor/' + id), fit: BoxFit.scaleDown)),
    );
  }
}
