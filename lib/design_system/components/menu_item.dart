import 'package:flutter/material.dart';
import 'package:odyssey_mobile/app/themes/theme.dart';
import 'package:odyssey_mobile/config/ootm_icons.dart';
import 'package:odyssey_mobile/design_system/components/toggle.dart';

/// Row of a bottom-sheet menu: leading icon, title and an optional trailing toggle or check mark.
/// A [selected] item is filled with the primary colour.
class MenuItem extends StatelessWidget {
  const MenuItem({
    required this.title,
    required this.onTap,
    this.icon,
    this.selected = false,
    this.toggle,
    this.onToggle,
    super.key,
  });

  final String title;
  final VoidCallback onTap;
  final IconData? icon;
  final bool selected;

  /// When non-null, a toggle is shown on the right.
  final bool? toggle;
  final ValueChanged<bool>? onToggle;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final buttons = theme.extension<OotmMainButtonTheme>()!;
    final foreground =
        selected ? buttons.tertiaryForegroundSelected! : buttons.tertiaryForeground!;

    return Semantics(
      button: true,
      selected: selected,
      child: Material(
        color: selected ? buttons.tertiaryBackgroundSelected : Colors.transparent,
        borderRadius: BorderRadius.circular(12),
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: onTap,
          highlightColor: selected ? buttons.tertiaryHighlightSelected : buttons.tertiaryHighlight,
          child: ConstrainedBox(
            constraints: const BoxConstraints(minHeight: 56),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Row(
                children: [
                  if (icon != null) ...[
                    Icon(icon, size: 22, color: foreground),
                    const SizedBox(width: 12),
                  ],
                  Expanded(
                    child: Text(
                      title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: theme.t.bodyMediumBold?.copyWith(color: foreground),
                    ),
                  ),
                  if (toggle != null) ...[
                    const SizedBox(width: 12),
                    OotmToggle(value: toggle!, onChanged: onToggle),
                  ],
                  if (selected) ...[
                    const SizedBox(width: 12),
                    Icon(OotmIcons.check, size: 22, color: foreground),
                  ],
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
