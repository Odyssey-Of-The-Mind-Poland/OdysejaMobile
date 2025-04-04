import 'package:flutter/material.dart';
import 'package:odyssey_mobile/app/themes/themes.dart';

class Heading extends StatelessWidget {
  const Heading(this.text, {this.leftPadding = 0, super.key});
  final String text;
  final double leftPadding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 16.0, bottom: 8.0, left: leftPadding),
      child: Text(text, style: AppTextStyles.h3),
    );
  }
}
