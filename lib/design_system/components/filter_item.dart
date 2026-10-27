import 'package:flutter/material.dart';
import 'package:odyssey_mobile/app/themes/theme.dart';

/// Small round chip with a short label (e.g. a stage or problem number) used in filter rows.
class FilterItem extends StatelessWidget {
  const FilterItem({
    required this.label,
    required this.active,
    required this.onPressed,
    super.key,
  });

  final String label;
  final bool active;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final buttons = theme.extension<OotmMainButtonTheme>()!;
    final foreground = active ? buttons.tertiaryForegroundSelected : buttons.tertiaryForeground;

    return Semantics(
      button: true,
      selected: active,
      child: Material(
        color: active ? buttons.tertiaryBackgroundSelected : buttons.tertiaryBackground,
        shape: StadiumBorder(
          side: BorderSide(
            color: (active ? buttons.tertiaryBorderSelected : buttons.tertiaryBorder)!,
            width: 2,
          ),
        ),
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: onPressed,
          highlightColor: active ? buttons.tertiaryHighlightSelected : buttons.tertiaryHighlight,
          child: ConstrainedBox(
            constraints: const BoxConstraints(minWidth: 40, minHeight: 40),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              child: Center(
                widthFactor: 1,
                child: Text(label, style: theme.t.bodyMediumBold?.copyWith(color: foreground)),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
