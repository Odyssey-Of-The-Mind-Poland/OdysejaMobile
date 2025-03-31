import 'package:flutter/material.dart';

class OotmBottomSheetTheme extends ThemeExtension<OotmBottomSheetTheme> {
  const OotmBottomSheetTheme({
    required this.handleColor,
    required this.backgroundColor,
    required this.borderColor,
    required this.closeButtonHighlight,
    required this.closeButtonForeground,
    required this.closeButtonBackground,
  });

  final Color? handleColor;
  final Color? backgroundColor;
  final Color? borderColor;
  final Color? closeButtonHighlight;
  final Color? closeButtonForeground;
  final Color? closeButtonBackground;

  @override
  OotmBottomSheetTheme copyWith({
    Color? handleColor,
    Color? backgroundColor,
    Color? borderColor,
    Color? closeButtonHighlight,
    Color? closeButtonForeground,
    Color? closeButtonBackground,
  }) =>
      OotmBottomSheetTheme(
        handleColor: handleColor ?? this.handleColor,
        backgroundColor: backgroundColor ?? this.backgroundColor,
        borderColor: borderColor ?? this.borderColor,
        closeButtonHighlight: closeButtonHighlight ?? this.closeButtonHighlight,
        closeButtonForeground: closeButtonForeground ?? this.closeButtonForeground,
        closeButtonBackground: closeButtonBackground ?? this.closeButtonBackground,
      );

  @override
  OotmBottomSheetTheme lerp(OotmBottomSheetTheme? other, double t) {
    if (identical(other, this)) {
      return this;
    }
    return OotmBottomSheetTheme(
      handleColor: Color.lerp(handleColor, other?.handleColor, t),
      backgroundColor: Color.lerp(backgroundColor, other?.backgroundColor, t),
      borderColor: Color.lerp(borderColor, other?.borderColor, t),
      closeButtonHighlight: Color.lerp(closeButtonHighlight, other?.closeButtonHighlight, t),
      closeButtonForeground: Color.lerp(closeButtonForeground, other?.closeButtonForeground, t),
      closeButtonBackground: Color.lerp(closeButtonBackground, other?.closeButtonBackground, t),
    );
  }
}

class OotmMainButtonTheme extends ThemeExtension<OotmMainButtonTheme> {
  const OotmMainButtonTheme({
    required this.primaryBackground,
    required this.primaryBorder,
    required this.primaryHighlight,
    required this.primaryForeground,
    required this.secondaryDefault,
    required this.secondaryPressed,
    required this.tertiaryForeground,
    required this.tertiaryBackground,
    required this.tertiaryBorder,
    required this.tertiaryHighlight,
    required this.tertiaryForegroundSelected,
    required this.tertiaryBackgroundSelected,
    required this.tertiaryBorderSelected,
    required this.tertiaryHighlightSelected,
  });

  final Color? primaryBackground;
  final Color? primaryBorder;
  final Color? primaryHighlight;
  final Color? primaryForeground;

  final Color? secondaryDefault;
  final Color? secondaryPressed;

  final Color? tertiaryForeground;
  final Color? tertiaryBackground;
  final Color? tertiaryBorder;
  final Color? tertiaryHighlight;
  final Color? tertiaryForegroundSelected;
  final Color? tertiaryBackgroundSelected;
  final Color? tertiaryBorderSelected;
  final Color? tertiaryHighlightSelected;

  @override
  OotmMainButtonTheme copyWith({
    Color? primaryBackground,
    Color? primaryBorder,
    Color? primaryHighlight,
    Color? primaryForeground,
    Color? secondaryDefault,
    Color? secondaryPressed,
    Color? tertiaryForeground,
    Color? tertiaryBackground,
    Color? tertiaryBorder,
    Color? tertiaryHighlight,
    Color? tertiaryForegroundSelected,
    Color? tertiaryBackgroundSelected,
    Color? tertiaryBorderSelected,
    Color? tertiaryHighlightSelected,
  }) =>
      OotmMainButtonTheme(
        primaryBackground: primaryBackground ?? this.primaryBackground,
        primaryBorder: primaryBorder ?? this.primaryBorder,
        primaryHighlight: primaryHighlight ?? this.primaryHighlight,
        primaryForeground: primaryForeground ?? this.primaryForeground,
        secondaryDefault: secondaryDefault ?? this.secondaryDefault,
        secondaryPressed: secondaryPressed ?? this.secondaryPressed,
        tertiaryForeground: tertiaryForeground ?? this.tertiaryForeground,
        tertiaryBackground: tertiaryBackground ?? this.tertiaryBackground,
        tertiaryBorder: tertiaryBorder ?? this.tertiaryBorder,
        tertiaryHighlight: tertiaryHighlight ?? this.tertiaryHighlight,
        tertiaryForegroundSelected: tertiaryForegroundSelected ?? this.tertiaryForegroundSelected,
        tertiaryBackgroundSelected: tertiaryBackgroundSelected ?? this.tertiaryBackgroundSelected,
        tertiaryBorderSelected: tertiaryBorderSelected ?? this.tertiaryBorderSelected,
        tertiaryHighlightSelected: tertiaryHighlightSelected ?? this.tertiaryHighlightSelected,
      );

  @override
  OotmMainButtonTheme lerp(OotmMainButtonTheme? other, double t) {
    if (identical(other, this)) {
      return this;
    }
    return OotmMainButtonTheme(
      primaryBackground: Color.lerp(primaryBackground, other?.primaryBackground, t),
      primaryBorder: Color.lerp(primaryBorder, other?.primaryBorder, t),
      primaryHighlight: Color.lerp(primaryHighlight, other?.primaryHighlight, t),
      primaryForeground: Color.lerp(primaryForeground, other?.primaryForeground, t),
      secondaryDefault: Color.lerp(secondaryDefault, other?.secondaryDefault, t),
      secondaryPressed: Color.lerp(secondaryPressed, other?.secondaryPressed, t),
      tertiaryForeground: Color.lerp(tertiaryForeground, other?.tertiaryForeground, t),
      tertiaryBackground: Color.lerp(tertiaryBackground, other?.tertiaryBackground, t),
      tertiaryBorder: Color.lerp(tertiaryBorder, other?.tertiaryBorder, t),
      tertiaryHighlight: Color.lerp(tertiaryHighlight, other?.tertiaryHighlight, t),
      tertiaryForegroundSelected:
          Color.lerp(tertiaryForegroundSelected, other?.tertiaryForegroundSelected, t),
      tertiaryBackgroundSelected:
          Color.lerp(tertiaryBackgroundSelected, other?.tertiaryBackgroundSelected, t),
      tertiaryBorderSelected: Color.lerp(tertiaryBorderSelected, other?.tertiaryBorderSelected, t),
      tertiaryHighlightSelected:
          Color.lerp(tertiaryHighlightSelected, other?.tertiaryHighlightSelected, t),
    );
  }
}

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
