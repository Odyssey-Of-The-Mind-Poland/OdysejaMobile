import 'package:flutter/material.dart';
import 'package:odyssey_mobile/app/themes/theme.dart';
import 'package:odyssey_mobile/config/ootm_icons.dart';

/// Floating pill showing the selected city; opens the city picker.
class CityButton extends StatelessWidget {
  const CityButton({required this.label, required this.onPressed, super.key});

  final String label;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final buttons = theme.extension<OotmMainButtonTheme>()!;
    final foreground = buttons.primaryForeground!;

    return Semantics(
      button: true,
      label: label,
      excludeSemantics: true,
      child: Material(
        color: buttons.primaryBackground,
        elevation: 4,
        shadowColor: Colors.black38,
        shape: StadiumBorder(side: BorderSide(color: buttons.primaryBorder!, width: 2)),
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: onPressed,
          highlightColor: buttons.primaryHighlight,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 12, 20, 12),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              spacing: 8,
              children: [
                Icon(OotmIcons.location, size: 22, color: foreground),
                Text(label, style: theme.t.bodyMediumBold?.copyWith(color: foreground)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
