import 'package:flutter/material.dart';
import 'package:odyssey_mobile/presentation/components/basic_box.dart';
import 'package:odyssey_mobile/app/themes.dart';

// Add disabled variant
class BoxWithBadge extends StatelessWidget {
  const BoxWithBadge(
      {Key? key,
      this.splashGradientPair,
      required this.onTap,
      required this.label,
      required this.badgeLabel})
      : super(key: key);
  final VoidCallback onTap;
  final String label;
  final SplashGradientPair? splashGradientPair;
  final String badgeLabel;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topRight,
      children: [
        BasicBox(
          label: label,
          onTap: onTap,
          splashGradientPair: splashGradientPair,
        ),
        Transform.translate(
          offset: const Offset(1.0, -1.0),
          child: Container(
            height: 24,
            width: 24,
            decoration: BoxDecoration(
              color: AppColors.pureWhite,
              borderRadius: BorderRadius.circular(AppValues.smallBrRadius),
            ),
            alignment: Alignment.center,
            child: Text(badgeLabel, style: AppTextStyles.h4),
          ),
        ),
      ],
    );
  }
}
