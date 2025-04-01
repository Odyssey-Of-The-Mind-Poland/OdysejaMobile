import 'package:flutter/material.dart';
import 'package:odyssey_mobile/app/themes/theme.dart';

enum _Level { primary, secondary, tertiary }

class MainButton extends StatelessWidget {
  const MainButton._({
    required this.onPressed,
    required this.text,
    required this.padding,
    required this.height,
    required _Level level,
    this.iconData,
    this.isSelected,
    super.key,
  }) : _level = level;

  factory MainButton.primary({
    required String label,
    required void Function() onPressed,
    required IconData iconData,
    Key? key,
  }) =>
      MainButton._(
        onPressed: onPressed,
        text: label,
        padding: EdgeInsets.fromLTRB(20, 12, 24, 12),
        iconData: iconData,
        height: 48,
        level: _Level.primary,
        key: key,
      );

  factory MainButton.secondary({
    required String label,
    required void Function() onPressed,
    required IconData iconData,
    Key? key,
  }) =>
      MainButton._(
        onPressed: onPressed,
        text: label,
        padding: EdgeInsets.fromLTRB(20, 12, 24, 12),
        iconData: iconData,
        height: 48,
        level: _Level.secondary,
        key: key,
      );

  factory MainButton.tertiary({
    required String label,
    required void Function() onPressed,
    required bool isSelected,
    Key? key,
  }) =>
      MainButton._(
        onPressed: onPressed,
        text: label,
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        isSelected: isSelected,
        height: 40,
        level: _Level.tertiary,
        key: key,
      );

  final void Function() onPressed;
  final String text;
  final EdgeInsets padding;
  final IconData? iconData;
  final bool? isSelected;
  final double height;
  final _Level _level;

  static const _defaultRadius = 80.0;
  static const _fallbackBorderColor = Colors.black;
  static const _defaultDuration = Duration(milliseconds: 200);

  @override
  Widget build(BuildContext context) {
    final ootmTheme = Theme.of(context).extension<OotmMainButtonTheme>();

    switch (_level) {
      case _Level.primary:
        return FilledButton(
          style: ButtonStyle(
            minimumSize: WidgetStatePropertyAll(Size(0, height)),
            textStyle: WidgetStatePropertyAll(
              Theme.of(context).t.bodyMediumBold?.copyWith(height: 1),
            ),
            padding: WidgetStatePropertyAll(padding),
            animationDuration: _defaultDuration,
            shape: WidgetStatePropertyAll(RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(_defaultRadius),
              side: BorderSide(
                width: 2,
                color: ootmTheme?.primaryBorder ?? _fallbackBorderColor,
              ),
            )),
            backgroundColor: WidgetStatePropertyAll(ootmTheme?.primaryBackground),
            foregroundColor: WidgetStatePropertyAll(ootmTheme?.primaryForeground),
            overlayColor: WidgetStatePropertyAll(ootmTheme?.primaryHighlight),
          ),
          onPressed: onPressed,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            spacing: 8,
            children: [
              Icon(iconData!),
              Text(text),
            ],
          ),
        );
      case _Level.secondary:
        return OutlinedButton(
          style: ButtonStyle(
            minimumSize: WidgetStatePropertyAll(Size(0, height)),
            textStyle: WidgetStatePropertyAll(
              Theme.of(context).t.bodyMediumBold?.copyWith(height: 1),
            ),
            padding: WidgetStatePropertyAll(padding),
            animationDuration: _defaultDuration,
            side: WidgetStateProperty.fromMap({
              WidgetState.pressed: BorderSide(
                width: 2,
                color: ootmTheme?.secondaryPressed ?? _fallbackBorderColor,
              ),
              WidgetState.any: BorderSide(
                width: 2,
                color: ootmTheme?.secondaryDefault ?? _fallbackBorderColor,
              ),
            }),
            shape: WidgetStatePropertyAll(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(_defaultRadius)),
            ),
            foregroundColor: WidgetStateProperty.fromMap({
              WidgetState.pressed: ootmTheme?.secondaryPressed,
              WidgetState.any: ootmTheme?.secondaryDefault,
            }),
            overlayColor: WidgetStatePropertyAll(Colors.transparent),
          ),
          onPressed: onPressed,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            spacing: 8,
            children: [
              Icon(iconData!),
              Text(text),
            ],
          ),
        );

      case _Level.tertiary:
        return FilledButton(
          style: ButtonStyle(
            minimumSize: WidgetStatePropertyAll(Size(0, height)),
            textStyle: WidgetStatePropertyAll(
              Theme.of(context).t.bodyMediumBold?.copyWith(height: 1),
            ),
            padding: WidgetStatePropertyAll(padding),
            animationDuration: _defaultDuration,
            shape: WidgetStatePropertyAll(RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(_defaultRadius),
              side: BorderSide(
                  width: 2,
                  color: (isSelected!
                          ? ootmTheme?.tertiaryBorderSelected
                          : ootmTheme?.tertiaryBorder) ??
                      _fallbackBorderColor),
            )),
            backgroundColor: WidgetStatePropertyAll(
              isSelected! ? ootmTheme?.tertiaryBackgroundSelected : ootmTheme?.tertiaryBackground,
            ),
            foregroundColor: WidgetStatePropertyAll(
              isSelected! ? ootmTheme?.tertiaryForegroundSelected : ootmTheme?.tertiaryForeground,
            ),
            overlayColor: WidgetStatePropertyAll(
              isSelected! ? ootmTheme?.tertiaryHighlightSelected : ootmTheme?.tertiaryHighlight,
            ),
          ),
          onPressed: onPressed,
          child: Text(text),
        );
    }
  }
}
