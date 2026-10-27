import 'package:flutter/material.dart';
import 'package:odyssey_mobile/app/themes/theme.dart';
import 'package:odyssey_mobile/config/ootm_icons.dart';
import 'package:odyssey_mobile/l10n/strings.dart';

/// Outlined pill that expands / collapses a performance group ("Pokaż wszystkie" / "Zwiń").
class ShowMoreButton extends StatefulWidget {
  const ShowMoreButton({required this.expanded, required this.initialExpanded, super.key});
  final ValueChanged<bool> expanded;
  final bool initialExpanded;

  @override
  State<ShowMoreButton> createState() => _ShowMoreButtonState();
}

class _ShowMoreButtonState extends State<ShowMoreButton> {
  late bool _expanded;

  @override
  void initState() {
    super.initState();
    _expanded = widget.initialExpanded;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final accent = theme.extension<OotmCommonTheme>()!.primaryColor!;
    final buttons = theme.extension<OotmMainButtonTheme>()!;

    return Padding(
      padding: const EdgeInsets.all(8),
      child: Material(
        color: Colors.transparent,
        shape: StadiumBorder(side: BorderSide(color: accent, width: 2)),
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          highlightColor: buttons.tertiaryHighlight,
          onTap: () => setState(() {
            _expanded = !_expanded;
            widget.expanded(_expanded);
          }),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              spacing: 4,
              children: [
                Text(
                  _expanded
                      ? AppStrings.performanceGroupButtonExpanded
                      : AppStrings.performanceGroupButtonExpand,
                  maxLines: 1,
                  style: theme.t.bodyMediumBold?.copyWith(color: accent),
                ),
                Icon(
                  _expanded ? OotmIcons.chevronUp : OotmIcons.chevronDown,
                  size: 22,
                  color: accent,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
