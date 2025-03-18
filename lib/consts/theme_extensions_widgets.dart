import 'package:flutter/material.dart';

class OotmNavigationBarThemeData extends ThemeExtension<OotmNavigationBarThemeData> {
  const OotmNavigationBarThemeData({
    required this.colorBackground,
    required this.indicatorBorderColor,
    required this.indicatorColor,
    required this.iconColorSelected,
    required this.iconColor,
    required this.borderColor,
    required this.highlightColor,
  });

  final Color? colorBackground;
  final Color? indicatorBorderColor;
  final Color? indicatorColor;
  final Color? iconColorSelected;
  final Color? iconColor;
  final Color? borderColor;
  final Color? highlightColor;

  @override
  OotmNavigationBarThemeData copyWith({
    Color? colorBackground,
    Color? indicatorBorderColor,
    Color? indicatorColor,
    Color? iconColorSelected,
    Color? iconColor,
    Color? borderColor,
    Color? highlightColor,
  }) =>
      OotmNavigationBarThemeData(
        colorBackground: colorBackground ?? this.colorBackground,
        indicatorBorderColor: indicatorBorderColor ?? this.indicatorBorderColor,
        indicatorColor: indicatorColor ?? this.indicatorColor,
        iconColorSelected: iconColorSelected ?? this.iconColorSelected,
        iconColor: iconColor ?? this.iconColor,
        borderColor: borderColor ?? this.borderColor,
        highlightColor: highlightColor ?? this.highlightColor,
      );

  @override
  OotmNavigationBarThemeData lerp(OotmNavigationBarThemeData? other, double t) {
    if (identical(other, this)) {
      return this;
    }
    return OotmNavigationBarThemeData(
      colorBackground: Color.lerp(colorBackground, other?.colorBackground, t),
      indicatorBorderColor: Color.lerp(indicatorBorderColor, other?.indicatorBorderColor, t),
      indicatorColor: Color.lerp(indicatorColor, other?.indicatorColor, t),
      iconColorSelected: Color.lerp(iconColorSelected, other?.iconColorSelected, t),
      iconColor: Color.lerp(iconColor, other?.iconColor, t),
      borderColor: Color.lerp(borderColor, other?.borderColor, t),
      highlightColor: Color.lerp(highlightColor, other?.highlightColor, t),
    );
  }
}
