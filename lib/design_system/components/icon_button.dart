import 'package:flutter/material.dart';
import 'package:odyssey_mobile/app/themes/theme.dart';
import 'package:odyssey_mobile/design_system/accent.dart';

/// Round 44px icon button. Neutral by default; pass [color] to tint it with an accent
/// (used on coloured top bars).
class OotmIconButton extends StatelessWidget {
  const OotmIconButton({
    required this.icon,
    required this.onPressed,
    this.color,
    this.semanticLabel,
    super.key,
  });

  final IconData icon;
  final VoidCallback? onPressed;
  final AccentColor? color;
  final String? semanticLabel;

  static const dimension = 44.0;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final top = theme.extension<TopBarTheme>()!;
    final accent = color == null ? null : theme.accents[color!];

    final background = accent?.background ?? top.actionBackground!;
    final border = accent?.border ?? top.actionBorder!;
    final foreground = accent?.foreground ?? top.actionForeground!;
    final pressed = accent?.border ?? top.actionBorderPressed!;

    return Semantics(
      button: true,
      label: semanticLabel,
      child: Material(
        color: background,
        shape: CircleBorder(side: BorderSide(color: border, width: 2)),
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: onPressed,
          highlightColor: pressed,
          child: SizedBox.square(
            dimension: dimension,
            child: Icon(icon, size: 22, color: foreground),
          ),
        ),
      ),
    );
  }
}
