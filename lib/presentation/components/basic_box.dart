import 'package:flutter/material.dart';
import 'package:odyssey_mobile/consts/themes.dart';

class BasicBox extends StatelessWidget {
  const BasicBox(
      {required this.onTap,
      required this.label,
      this.splashGradientPair,
      this.centerLabel = false,
      super.key});

  final VoidCallback onTap;
  final String label;
  final SplashGradientPair? splashGradientPair;
  final bool centerLabel;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: splashGradientPair?.splashColor,
      borderRadius: BorderRadius.circular(AppValues.defaultBrRadius),
      onTap: onTap,
      child: Ink(
        height: AppValues.defaultBoxDimension,
        width: AppValues.defaultBoxDimension,
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          gradient: splashGradientPair?.gradient,
          color: AppColors.darkestGrey,
          borderRadius: BorderRadius.circular(AppValues.defaultBrRadius),
        ),
        child: Align(
          alignment: centerLabel ? Alignment.center : Alignment.bottomLeft,
          child: Text(label,
              maxLines: 4,
              overflow: TextOverflow.ellipsis,
              style: AppTextStyles.subtitleWhite,
              textAlign: centerLabel ? TextAlign.center : null),
        ),
      ),
    );
  }
}
