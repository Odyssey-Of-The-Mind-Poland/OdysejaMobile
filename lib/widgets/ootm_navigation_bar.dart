import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:odyssey_mobile/app/themes/theme.dart';
import 'package:odyssey_mobile/widgets/elements/animation_status_builder.dart';
import 'package:odyssey_mobile/widgets/elements/selectable_animated_builder.dart';

/// Inspired by [NavigationBar] implementation.
class OotmNavigationBar extends StatelessWidget {
  const OotmNavigationBar({
    super.key,
    required this.destinations,
    required this.onDestinationSelected,
    required this.selectedIndex,
    this.blurEnabled = false,
  })  : assert(destinations.length >= 2),
        assert(0 <= selectedIndex && selectedIndex < destinations.length);

  final List<Destination> destinations;
  final Function(int index) onDestinationSelected;
  final int selectedIndex;
  final bool blurEnabled;

  static const _defaultHeight = 72.0;
  static const _defaultDuration = Duration(milliseconds: 300);
  static const _fallbackBorderColor = Colors.black;
  static const _defaultBorderWidth = 2.0;
  static const _defaultBlur = 8.0;

  Color? _backgroundColor(OotmNavigationBarThemeData? theme) =>
      blurEnabled ? theme?.colorBackground?.withValues(alpha: 0.98) : theme?.colorBackground;

  @override
  Widget build(BuildContext context) {
    final ootmTheme = Theme.of(context).extension<OotmNavigationBarThemeData>();
    return ClipRRect(
      child: BackdropFilter(
        blendMode: BlendMode.srcOver,
        filter: ImageFilter.blur(
          sigmaX: _defaultBlur,
          sigmaY: _defaultBlur,
          tileMode: TileMode.clamp,
        ),
        enabled: blurEnabled,
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: _backgroundColor(ootmTheme),
            border: Border(
              top: BorderSide(
                width: _defaultBorderWidth,
                color: ootmTheme?.borderColor ?? _fallbackBorderColor,
              ),
            ),
          ),
          child: SafeArea(
            child: SizedBox(
              height: _defaultHeight,
              child: Row(
                children: [
                  for (int i = 0; i < destinations.length; i++)
                    Expanded(
                      child: SelectableAnimatedBuilder(
                        alwaysDoFullAnimation: false,
                        duration: _defaultDuration,
                        isSelected: i == selectedIndex,
                        builder: (BuildContext context, Animation<double> animation) {
                          return _NavigationButton(
                            destination: destinations[i],
                            isSelected: selectedIndex == i,
                            selectedAnimation: animation,
                            onTap: () => onDestinationSelected(i),
                            theme: ootmTheme,
                          );
                        },
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

class Destination {
  Destination({required this.iconData, required this.label});

  final IconData iconData;

  /// Can be used in a tooltip or for semantics.
  final String label;
}

class _NavigationButton extends StatelessWidget {
  const _NavigationButton({
    required this.destination,
    required this.isSelected,
    required this.onTap,
    required this.selectedAnimation,
    required this.theme,
  });

  final Destination destination;
  final bool isSelected;
  final void Function() onTap;
  final Animation<double> selectedAnimation;
  final OotmNavigationBarThemeData? theme;

  static const _defaultIndicatorHeight = 40.0;
  static const _defaultIndicatorWidth = 56.0;
  static const _defaultIndicatorRadius = 80.0;
  static const _defaultIndicatorBorderWidth = 2.0;

  Animation<Decoration> get decorationAnimation => DecorationTween(
        begin: BoxDecoration(
          borderRadius: BorderRadius.circular(_defaultIndicatorRadius),
        ),
        end: BoxDecoration(
          color: theme?.indicatorColor,
          border: Border.all(
            width: _defaultIndicatorBorderWidth,
            color: theme?.indicatorBorderColor ?? _fallbackIndicatorBorderColor,
          ),
          borderRadius: BorderRadius.circular(_defaultIndicatorRadius),
        ),
      ).animate(CurvedAnimation(parent: selectedAnimation, curve: _defaultCurve));

  Animation<Color?> get iconAnimation => ColorTween(
        begin: theme?.iconColor,
        end: theme?.iconColorSelected,
      ).animate(CurvedAnimation(parent: selectedAnimation, curve: _defaultCurve));

  static const _fallbackIndicatorBorderColor = Colors.black;

  /// On selection, more gentle starting curves result in a clash between the grey highlight
  /// easing out (the button is no longer pressed) and the orange selection indicator coming in.
  /// More drastic choice mitigates the perceived flash. In case of further issues, a fade out
  /// transition for [Material] widget that's splashed upon can be considered.
  static const _defaultCurve = Curves.easeOut;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: _defaultIndicatorHeight,
        width: _defaultIndicatorWidth,
        child: DecoratedBoxTransition(
          decoration: decorationAnimation,

          /// [AnimationStatusBuilder] here waits for animation status change before switching from
          /// unselected highlight to selected highlight. This way we don't intrude an immediate
          /// color switch of the highlight.
          child: AnimationStatusBuilder(
              animation: selectedAnimation,
              builder: (BuildContext context, Widget? child) {
                return Material(
                  type: MaterialType.transparency,
                  child: InkWell(
                    onTap: onTap,
                    borderRadius: BorderRadius.circular(_defaultIndicatorRadius),
                    highlightColor: selectedAnimation.isCompleted ? theme?.highlightColor : null,
                    child: AnimatedBuilder(
                      animation: iconAnimation,
                      builder: (context, child) =>
                          Icon(destination.iconData, color: iconAnimation.value, size: 24),
                    ),
                  ),
                );
              }),
        ),
      ),
    );
  }
}
