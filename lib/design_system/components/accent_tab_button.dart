import 'package:flutter/material.dart';
import 'package:odyssey_mobile/app/themes/theme.dart';
import 'package:odyssey_mobile/design_system/accent.dart';

/// Pill tab tinted with an accent (e.g. "Sobota" / "Niedziela" on a coloured header).
/// The selected tab is filled with the strong shade, the others keep the pale tint.
class AccentTabButton extends StatelessWidget {
  const AccentTabButton({
    required this.label,
    required this.color,
    required this.selected,
    required this.onPressed,
    super.key,
  });

  final String label;
  final AccentColor color;
  final bool selected;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final surface = theme.accents[color];
    final background = selected ? surface.badgeBackground : surface.background;
    final foreground = selected ? surface.badgeForeground : surface.foreground;

    return Semantics(
      button: true,
      selected: selected,
      child: Material(
        color: background,
        shape: StadiumBorder(
          side: BorderSide(color: selected ? surface.badgeBackground : surface.border, width: 2),
        ),
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: onPressed,
          child: ConstrainedBox(
            constraints: const BoxConstraints(minWidth: 123, minHeight: 40),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Center(
                widthFactor: 1,
                heightFactor: 1,
                child: Text(label, style: theme.t.bodyMediumBold?.copyWith(color: foreground)),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
