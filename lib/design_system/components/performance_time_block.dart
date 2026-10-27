import 'package:flutter/material.dart';
import 'package:odyssey_mobile/app/themes/theme.dart';
import 'package:odyssey_mobile/config/ootm_icons.dart';
import 'package:odyssey_mobile/design_system/components/info_tooltip.dart';

/// "Sb • 08:15" with a caption ("Występ") and an info bubble; two of them sit side by side
/// in the performance bottom sheet (performance and spontaneous task).
class PerformanceTimeBlock extends StatelessWidget {
  const PerformanceTimeBlock({
    required this.day,
    required this.time,
    required this.caption,
    required this.hint,
    this.highlighted = false,
    super.key,
  });

  final String day;
  final String time;
  final String caption;

  /// Text of the bubble; supports `**bold**`.
  final String hint;
  final bool highlighted;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final common = theme.extension<OotmCommonTheme>()!;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          '$day • $time',
          style: theme.t.h2?.copyWith(color: highlighted ? common.primaryColor : null),
        ),
        InfoTooltip(
          message: hint,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              spacing: 4,
              children: [
                Text(caption, style: theme.t.bodyMediumRegular?.copyWith(color: common.textLighterColor)),
                Icon(OotmIcons.info, size: 14, color: theme.c.universal.blue.color300),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
