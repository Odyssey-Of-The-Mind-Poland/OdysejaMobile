import 'package:flutter/material.dart';
import 'package:odyssey_mobile/app/themes/theme.dart';
import 'package:odyssey_mobile/config/ootm_icons.dart';
import 'package:odyssey_mobile/design_system/accent.dart';

enum PerformanceTileState {
  normal,

  /// The performance is in the user's favourites.
  favourite,

  /// The performance is the one currently searched for.
  highlighted,
}

/// Row of a schedule: start time, team name and a chevron.
class PerformanceTile extends StatelessWidget {
  const PerformanceTile({
    required this.time,
    required this.title,
    this.state = PerformanceTileState.normal,
    this.onTap,
    super.key,
  });

  final String time;
  final String title;
  final PerformanceTileState state;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final common = theme.extension<OotmCommonTheme>()!;
    final favourite = state == PerformanceTileState.favourite;
    final highlighted = state == PerformanceTileState.highlighted;
    final orange = theme.accents[AccentColor.orange];

    final background = favourite ? orange.background : common.surfaceColor!;
    final border = switch (state) {
      PerformanceTileState.normal => common.borderColor!,
      PerformanceTileState.favourite => orange.border,
      PerformanceTileState.highlighted => common.primaryColor!,
    };
    final textColor = favourite || highlighted ? common.primaryColor : null;

    return Semantics(
      button: onTap != null,
      label: '$time $title',
      excludeSemantics: true,
      child: Material(
        color: background,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: BorderSide(color: border, width: 2),
        ),
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: onTap,
          child: ConstrainedBox(
            constraints: const BoxConstraints(minHeight: 64),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              child: Row(
                spacing: 12,
                children: [
                  SizedBox(
                    width: 74,
                    child: Text(
                      time,
                      textAlign: TextAlign.center,
                      style: theme.t.h2?.copyWith(color: textColor),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: theme.t.bodyMediumRegular?.copyWith(color: textColor),
                    ),
                  ),
                  Icon(OotmIcons.chevronRight, size: 22, color: common.textLighterColor),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
