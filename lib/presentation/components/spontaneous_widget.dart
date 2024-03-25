import 'package:flutter/material.dart';
import 'package:odyssey_mobile/consts/themes.dart';
import 'package:odyssey_mobile/domain/entities/performance.dart';

class SpontaneousWidget extends StatelessWidget {
  const SpontaneousWidget({
    required this.performance,
    required this.secretWidth,
    super.key,
  });

  final Performance performance;
  final double secretWidth;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        margin: const EdgeInsets.all(1),
        alignment: Alignment.center,
        // -1 to hide the widget below upper layer.
        width: secretWidth,
        decoration: BoxDecoration(
          color: AppColors.darkestBlue,
          borderRadius: BorderRadius.circular(AppValues.defaultBrRadius),
        ),
        child: FittedBox(
          // check if it is neccesary to display the day
          child: performance.spontanDay == performance.performanceDay
              ? _text
              : Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Text(performance.spontanDay,
                      style: AppTextStyles.caption.copyWith(color: AppColors.pureWhite)),
                  const SizedBox(height: 2),
                  _text,
                ]),
        ),
      ),
    );
  }

  // In general widget functions are not recommended, however, in this case it should not matter.
  Widget get _text => RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
          style: AppTextStyles.h3White.copyWith(fontWeight: FontWeight.w400),
          text: 'SPO ',
          children: [TextSpan(text: performance.spontan, style: AppTextStyles.h3White)]));
}
