import 'package:flutter/material.dart';
import 'package:odyssey_mobile/app/themes/theme.dart';

/// Entry of the favourites timeline: time, a node on the vertical line and the performance.
/// Entries that are not [emphasized] (e.g. already past) are faded.
class TimelineItem extends StatelessWidget {
  const TimelineItem({
    required this.time,
    required this.title,
    required this.subtitle,
    this.emphasized = true,
    this.isFirst = false,
    this.isLast = false,
    super.key,
  });

  final String time;
  final String title;
  final String subtitle;
  final bool emphasized;
  final bool isFirst;
  final bool isLast;

  static const _nodeSize = 14.0;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final common = theme.extension<OotmCommonTheme>()!;
    final accent = common.primaryColor!;
    final fade = emphasized ? 1.0 : 0.5;

    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            width: 48,
            child: Padding(
              padding: const EdgeInsets.only(top: 2),
              child: Text(
                time,
                style: theme.t.bodyMediumBold?.copyWith(color: accent.withValues(alpha: fade)),
              ),
            ),
          ),
          SizedBox(
            width: 28,
            child: Column(
              children: [
                SizedBox(
                  height: 5,
                  child: isFirst ? null : VerticalDivider(width: 2, thickness: 2, color: common.borderColor),
                ),
                Container(
                  width: _nodeSize,
                  height: _nodeSize,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: common.surfaceColor,
                    border: Border.all(color: accent.withValues(alpha: fade), width: emphasized ? 3 : 2),
                  ),
                ),
                Expanded(
                  child: isLast
                      ? const SizedBox.shrink()
                      : VerticalDivider(width: 2, thickness: 2, color: common.borderColor),
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: () {
                      final base = emphasized ? theme.t.bodyMediumBold : theme.t.bodyMediumRegular;
                      return base?.copyWith(color: base.color?.withValues(alpha: fade));
                    }(),
                  ),
                  Text(
                    subtitle,
                    style: theme.t.bodySmallRegular?.copyWith(color: common.textLighterColor),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
