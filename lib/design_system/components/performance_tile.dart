import 'package:flutter/material.dart';
import 'package:odyssey_mobile/app/themes/theme.dart';
import 'package:odyssey_mobile/config/ootm_icons.dart';
import 'package:odyssey_mobile/design_system/components/accent_pattern.dart';
import 'package:odyssey_mobile/design_system/favourite_surface.dart';

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
    final fav = theme.favourite;
    final favourite = state == PerformanceTileState.favourite;
    final highlighted = state == PerformanceTileState.highlighted;

    final background = favourite ? fav.background : common.surfaceColor!;
    final border = switch (state) {
      PerformanceTileState.normal => common.borderColor!,
      PerformanceTileState.favourite => fav.border,
      PerformanceTileState.highlighted => common.primaryColor!,
    };
    final timeColor = favourite ? fav.time : (highlighted ? common.primaryColor : null);
    final textColor = favourite ? fav.text : null;

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
          child: Stack(
            alignment: Alignment.center,
            children: [
              if (favourite)
                Positioned.fill(
                  child: AccentPattern(icon: OotmIcons.favouritesFilled, color: fav.pattern),
                ),
              ConstrainedBox(
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
                          style: theme.t.h2?.copyWith(color: timeColor),
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
            ],
          ),
        ),
      ),
    );
  }
}
