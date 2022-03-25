import 'package:flutter/material.dart';
import 'package:odyssey_mobile/app/themes.dart';

class SpontaneousWidget extends StatelessWidget {
  const SpontaneousWidget(
    this.text, {
    required this.secretWidth,
    required this.height,
    Key? key,
  }) : super(key: key);

  final String text;
  final double secretWidth;
  final double height;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        alignment: Alignment.center,
        // -1 to hide the widget below upper layer.
        height: height - 1,
        width: secretWidth,
        decoration: BoxDecoration(
          color: AppColors.darkestBlue,
          borderRadius: BorderRadius.circular(AppValues.defaultBrRadius),
        ),
        child: RichText(
            text: TextSpan(
                style: AppTextStyles.h3White.copyWith(fontWeight: FontWeight.w400),
                text: 'SPO ',
                children: [TextSpan(text: text, style: AppTextStyles.h3White)])),
      ),
    );
  }
}
