import 'package:flutter/material.dart';
import 'package:odyssey_mobile/app/themes/theme.dart';
import 'package:odyssey_mobile/config/ootm_icons.dart';
import 'package:odyssey_mobile/design_system/accent.dart';
import 'package:odyssey_mobile/design_system/components/accent_pattern.dart';
import 'package:odyssey_mobile/design_system/components/icon_button.dart';

/// Collapsing header tinted with an accent and decorated with the icon pattern.
/// Expanded it shows [title] with [subtitle] under it (and an optional [bottom], e.g. day tabs);
/// collapsed it shrinks to a single "title • subtitle" line next to the back button.
class AccentSliverTopBar extends StatelessWidget {
  const AccentSliverTopBar({
    required this.title,
    required this.icon,
    required this.color,
    this.subtitle,
    this.bottom,
    this.onBack,
    super.key,
  });

  final String title;
  final String? subtitle;
  final IconData icon;
  final AccentColor color;
  final Widget? bottom;
  final VoidCallback? onBack;

  static const collapsedHeight = 76.0;
  static const _expandedBase = 148.0;
  static const bottomHeight = 56.0;

  @override
  Widget build(BuildContext context) {
    final topInset = MediaQuery.paddingOf(context).top;
    final expanded = _expandedBase + (bottom == null ? 0 : bottomHeight);

    return SliverPersistentHeader(
      pinned: true,
      delegate: _Delegate(
        bar: this,
        topInset: topInset,
        minHeight: topInset + collapsedHeight,
        maxHeight: topInset + expanded,
      ),
    );
  }
}

class _Delegate extends SliverPersistentHeaderDelegate {
  _Delegate({
    required this.bar,
    required this.topInset,
    required this.minHeight,
    required this.maxHeight,
  });

  final AccentSliverTopBar bar;
  final double topInset;
  final double minHeight;
  final double maxHeight;

  @override
  double get minExtent => minHeight;

  @override
  double get maxExtent => maxHeight;

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    final theme = Theme.of(context);
    final surface = theme.accents[bar.color];
    final range = maxHeight - minHeight;
    final t = range == 0 ? 1.0 : (shrinkOffset / range).clamp(0.0, 1.0);
    final collapsedLabel = bar.subtitle == null ? bar.title : '${bar.title} • ${bar.subtitle}';

    return DecoratedBox(
      decoration: BoxDecoration(
        color: surface.background,
        border: Border(bottom: BorderSide(color: surface.border, width: 2)),
      ),
      child: Stack(
        children: [
          Positioned.fill(child: AccentPattern(icon: bar.icon, color: surface.pattern)),
          Padding(
            padding: EdgeInsets.fromLTRB(16, topInset + 16, 16, 16),
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: OotmIconButton(
                    icon: OotmIcons.arrowLeft,
                    color: bar.color,
                    semanticLabel: MaterialLocalizations.of(context).backButtonTooltip,
                    onPressed: bar.onBack ?? () => Navigator.of(context).maybePop(),
                  ),
                ),
                Positioned(
                  left: 56,
                  right: 0,
                  top: 0,
                  height: OotmIconButton.dimension,
                  child: Opacity(
                    opacity: t,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        collapsedLabel,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: theme.t.h3?.copyWith(color: surface.foreground),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: Opacity(
                    opacity: 1 - t,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(bar.title, style: theme.t.h3?.copyWith(color: surface.foreground)),
                        if (bar.subtitle != null)
                          Text(
                            bar.subtitle!,
                            style: theme.t.bodyMediumRegular?.copyWith(color: surface.foreground),
                          ),
                        if (bar.bottom != null) ...[
                          const SizedBox(height: 12),
                          bar.bottom!,
                        ],
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  bool shouldRebuild(_Delegate old) =>
      old.bar.title != bar.title ||
      old.bar.subtitle != bar.subtitle ||
      old.bar.color != bar.color ||
      old.bar.icon != bar.icon ||
      old.bar.bottom != bar.bottom ||
      old.topInset != topInset ||
      old.maxHeight != maxHeight;
}
