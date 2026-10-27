import 'package:flutter/material.dart';
import 'package:odyssey_mobile/app/themes/theme.dart';
import 'package:odyssey_mobile/design_system/accent.dart';
import 'package:odyssey_mobile/design_system/components/accent_pattern.dart';

/// Tile of an info category: tinted surface, icon pattern in the background
/// and the title aligned to the bottom.
class InfoTile extends StatelessWidget {
  const InfoTile({
    required this.title,
    required this.icon,
    required this.color,
    this.onTap,
    this.height = 80,
    super.key,
  });

  final String title;
  final IconData icon;
  final AccentColor color;
  final VoidCallback? onTap;
  final double height;

  static const _radius = 16.0;
  static const _borderWidth = 2.0;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final surface = theme.accents[color];
    final radius = BorderRadius.circular(_radius);

    return Semantics(
      button: onTap != null,
      label: title,
      excludeSemantics: true,
      child: Material(
        color: surface.background,
        shape: RoundedRectangleBorder(
          borderRadius: radius,
          side: BorderSide(color: surface.border, width: _borderWidth),
        ),
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: onTap,
          child: SizedBox(
            height: height,
            child: Stack(
              children: [
                Positioned.fill(child: AccentPattern(icon: icon, color: surface.pattern)),
                Padding(
                  padding: const EdgeInsets.all(16 - _borderWidth),
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: theme.t.bodyMediumBold?.copyWith(color: surface.foreground),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
