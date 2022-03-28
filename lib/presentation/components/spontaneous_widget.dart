import 'package:flutter/material.dart';
import 'package:odyssey_mobile/app/themes.dart';
import 'package:odyssey_mobile/domain/entities/performance.dart';

class SpontaneousWidget extends StatelessWidget {
  const SpontaneousWidget({
    required this.performance,
    required this.secretWidth,
    required this.height,
    Key? key,
  }) : super(key: key);

  final Performance performance;
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
    );
  }

  // In general widget functions are not recommended, however, in this case it should not matter.
  Widget get _text => RichText(
      text: TextSpan(
          style: AppTextStyles.h3White.copyWith(fontWeight: FontWeight.w400),
          text: 'SPO ',
          children: [TextSpan(text: performance.spontan, style: AppTextStyles.h3White)]));
}
