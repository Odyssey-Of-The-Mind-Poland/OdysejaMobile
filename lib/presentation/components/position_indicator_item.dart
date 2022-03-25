import 'package:flutter/material.dart';
import 'package:odyssey_mobile/app/themes.dart';

class PositionIndicatorItem extends StatelessWidget {
  const PositionIndicatorItem(this.active, {Key? key}) : super(key: key);
  final bool active;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      margin: const EdgeInsets.symmetric(horizontal: 2),
      height: 8,
      width: active ? 32 : 8,
      decoration: BoxDecoration(
        color: active ? AppColors.primaryOrange : AppColors.mediumGrey,
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }
}
