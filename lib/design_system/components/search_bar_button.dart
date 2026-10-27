import 'package:flutter/material.dart';
import 'package:odyssey_mobile/app/themes/theme.dart';
import 'package:odyssey_mobile/config/ootm_icons.dart';

/// Search field that only opens the search screen on tap (the actual input lives there).
class SearchBarButton extends StatelessWidget {
  const SearchBarButton({required this.hint, required this.onTap, super.key});

  final String hint;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final common = theme.extension<OotmCommonTheme>()!;

    return Semantics(
      button: true,
      label: hint,
      excludeSemantics: true,
      child: Material(
        color: common.surfaceColor,
        shape: StadiumBorder(side: BorderSide(color: common.borderColor!, width: 2)),
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: onTap,
          child: ConstrainedBox(
            constraints: const BoxConstraints(minHeight: 56),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                spacing: 8,
                children: [
                  Icon(OotmIcons.search, size: 24, color: common.textLighterColor),
                  Expanded(
                    child: Text(
                      hint,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: theme.t.bodyMediumBold?.copyWith(color: common.textLighterColor),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
