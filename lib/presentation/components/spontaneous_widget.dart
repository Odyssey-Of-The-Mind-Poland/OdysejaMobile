import 'package:flutter/material.dart';
import 'package:odyssey_mobile/app/themes/theme.dart';
import 'package:odyssey_mobile/core/domain/performance.dart';
import 'package:odyssey_mobile/l10n/strings.dart';

/// Revealed under a performance row when it is swiped to the left: the time of the
/// spontaneous task of that team.
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
    final theme = Theme.of(context);
    final blue = theme.c.universal.blue;
    final foreground = theme.c.universal.grey.color200;
    final showDay = performance.spontanDay != performance.performanceDay;

    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        width: secretWidth,
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(horizontal: 8),
        decoration: BoxDecoration(
          color: blue.color300,
          border: Border.all(color: blue.color200!.withValues(alpha: 0.24), width: 2),
          borderRadius: BorderRadius.circular(16),
        ),
        child: FittedBox(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                AppStrings.spontan,
                style: theme.t.bodySmallRegular?.copyWith(color: foreground),
              ),
              Text(
                showDay ? '${performance.spontanDay} • ${performance.spontan}' : performance.spontan,
                style: theme.t.bodyMediumBold?.copyWith(color: foreground),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
