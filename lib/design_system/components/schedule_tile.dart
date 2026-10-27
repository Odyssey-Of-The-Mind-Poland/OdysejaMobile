import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:odyssey_mobile/app/themes/theme.dart';
import 'package:odyssey_mobile/config/ootm_icons.dart';
import 'package:odyssey_mobile/design_system/accent.dart';
import 'package:odyssey_mobile/design_system/components/accent_pattern.dart';

/// Tile of a schedule group (e.g. a problem): number badge, title and a sparse icon pattern.
/// A [locked] tile is covered with a dimmed overlay and ignores taps.
class ScheduleTile extends StatelessWidget {
  const ScheduleTile({
    required this.number,
    required this.title,
    required this.icon,
    required this.color,
    this.locked = false,
    this.onTap,
    super.key,
  });

  final String number;
  final String title;
  final IconData icon;
  final AccentColor color;
  final bool locked;
  final VoidCallback? onTap;

  static const size = Size(140, 120);
  static const _radius = 16.0;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final surface = theme.accents[color];
    final textTheme = theme.t.bodyMediumBold;

    return Semantics(
      button: !locked && onTap != null,
      enabled: !locked,
      label: '$number $title',
      excludeSemantics: true,
      child: Material(
        color: surface.background,
        borderRadius: BorderRadius.circular(_radius),
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: locked ? null : onTap,
          child: SizedBox.fromSize(
            size: size,
            child: Stack(
              children: [
                Positioned.fill(
                  child: AccentPattern(icon: icon, color: surface.pattern, spacing: 56),
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 24,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: surface.badgeBackground,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Text(
                          number,
                          style: textTheme?.copyWith(color: surface.badgeForeground),
                        ),
                      ),
                      const Spacer(),
                      Text(
                        title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: textTheme?.copyWith(color: surface.foreground),
                      ),
                    ],
                  ),
                ),
                if (locked) const Positioned.fill(child: _LockedOverlay()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _LockedOverlay extends StatelessWidget {
  const _LockedOverlay();

  @override
  Widget build(BuildContext context) {
    final grey = Theme.of(context).c.universal.grey;
    return ClipRRect(
      borderRadius: BorderRadius.circular(ScheduleTile._radius),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 1, sigmaY: 1),
        child: ColoredBox(
          color: grey.color500!.withValues(alpha: 0.8),
          child: Center(child: Icon(OotmIcons.lock, size: 24, color: grey.color100)),
        ),
      ),
    );
  }
}
