import 'package:flutter/material.dart';

/// App styling settings extracted from the design system.
class AppStyling extends ThemeExtension<AppStyling> {
  const AppStyling();

  @override
  ThemeExtension<AppStyling> copyWith() {
    // TODO: implement copyWith
    return this;
  }

  @override
  ThemeExtension<AppStyling> lerp(covariant ThemeExtension<AppStyling>? other, double t) {
    // TODO: implement lerp
    return this;
  }
}

class AppTypography extends ThemeExtension<AppTypography> {
  const AppTypography({
    required this.h1,
    required this.h2,
    required this.h3,
    required this.bodyLargeBold,
    required this.bodyLargeRegular,
    required this.bodyMediumBold,
    required this.bodyMediumRegular,
    required this.bodySmallBold,
    required this.bodySmallRegular,
  });

  final TextStyle? h1;
  final TextStyle? h2;
  final TextStyle? h3;
  final TextStyle? bodyLargeBold;
  final TextStyle? bodyLargeRegular;
  final TextStyle? bodyMediumBold;
  final TextStyle? bodyMediumRegular;
  final TextStyle? bodySmallRegular;
  final TextStyle? bodySmallBold;

  @override
  AppTypography copyWith({
    TextStyle? h1,
    TextStyle? h2,
    TextStyle? h3,
    TextStyle? bodyLargeBold,
    TextStyle? bodyLargeRegular,
    TextStyle? bodyMediumBold,
    TextStyle? bodyMediumRegular,
    TextStyle? bodySmallRegular,
    TextStyle? bodySmallBold,
  }) =>
      AppTypography(
        h1: h1 ?? this.h1,
        h2: h2 ?? this.h2,
        h3: h3 ?? this.h3,
        bodyLargeBold: bodyLargeBold ?? this.bodyLargeBold,
        bodyLargeRegular: bodyLargeRegular ?? this.bodyLargeRegular,
        bodyMediumBold: bodyMediumBold ?? this.bodyMediumBold,
        bodyMediumRegular: bodyMediumRegular ?? this.bodyMediumRegular,
        bodySmallBold: bodySmallBold ?? this.bodySmallBold,
        bodySmallRegular: bodySmallRegular ?? this.bodySmallRegular,
      );

  @override
  AppTypography lerp(AppTypography? other, double t) {
    if (identical(other, this)) {
      return this;
    }
    return AppTypography(
      h1: TextStyle.lerp(h1, other?.h1, t),
      h2: TextStyle.lerp(h2, other?.h2, t),
      h3: TextStyle.lerp(h3, other?.h3, t),
      bodyLargeBold: TextStyle.lerp(bodyLargeBold, other?.bodyLargeBold, t),
      bodyLargeRegular: TextStyle.lerp(bodyLargeRegular, other?.bodyLargeRegular, t),
      bodyMediumBold: TextStyle.lerp(bodyMediumBold, other?.bodyMediumBold, t),
      bodyMediumRegular: TextStyle.lerp(bodyMediumRegular, other?.bodyMediumRegular, t),
      bodySmallBold: TextStyle.lerp(bodySmallBold, other?.bodySmallBold, t),
      bodySmallRegular: TextStyle.lerp(bodySmallRegular, other?.bodySmallRegular, t),
    );
  }
}

class AppColors extends ThemeExtension<AppColors> {
  const AppColors({required this.universal, required this.primary, required this.accent});

  final UniversalColors universal;
  final ColorSet primary;
  final AccentColors accent;

  @override
  AppColors copyWith({UniversalColors? universal, ColorSet? primary, AccentColors? accent}) {
    return AppColors(
      universal: universal ?? this.universal,
      primary: primary ?? this.primary,
      accent: accent ?? this.accent,
    );
  }

  @override
  AppColors lerp(AppColors? other, double t) {
    if (identical(other, this)) {
      return this;
    }
    return AppColors(
      universal: universal.lerp(other?.universal, t),
      primary: primary.lerp(other?.primary, t),
      accent: accent.lerp(other?.accent, t),
    );
  }
}

class UniversalColors {
  const UniversalColors({
    required this.grey,
    required this.blue,
    required this.green,
    required this.red,
  });

  final ColorSet grey;
  final ColorSet blue;
  final ColorSet green;
  final ColorSet red;

  UniversalColors lerp(UniversalColors? other, double t) {
    if (identical(other, this)) {
      return this;
    }
    return UniversalColors(
      blue: blue.lerp(other?.blue, t),
      grey: grey.lerp(other?.grey, t),
      green: green.lerp(other?.green, t),
      red: red.lerp(other?.red, t),
    );
  }
}

class AccentColors {
  const AccentColors({
    required this.blue,
    required this.orange,
    required this.red,
    required this.purple,
    required this.green,
  });

  final ColorSet blue;
  final ColorSet orange;
  final ColorSet red;
  final ColorSet purple;
  final ColorSet green;

  AccentColors lerp(AccentColors? other, double t) {
    if (identical(other, this)) {
      return this;
    }
    return AccentColors(
      blue: blue.lerp(other?.blue, t),
      orange: orange.lerp(other?.orange, t),
      red: red.lerp(other?.red, t),
      purple: purple.lerp(other?.purple, t),
      green: green.lerp(other?.green, t),
    );
  }
}

class ColorSet {
  const ColorSet({
    required this.color100,
    this.color200,
    required this.color300,
    this.color400,
    required this.color500,
    this.color600,
    required this.color700,
  });

  final Color? color100;
  final Color? color200;
  final Color? color300;
  final Color? color400;
  final Color? color500;
  final Color? color600;
  final Color? color700;

  Color? operator [](int level) {
    switch (level) {
      case 100:
        return color100;
      case 200:
        return color200;
      case 300:
        return color300;
      case 400:
        return color400;
      case 500:
        return color500;
      case 600:
        return color600;
      case 700:
        return color700;
      default:
        throw ArgumentError('Invalid color level: $level');
    }
  }

  ColorSet lerp(ColorSet? other, double t) {
    if (identical(other, this)) {
      return this;
    }
    return ColorSet(
      color100: Color.lerp(color100, other?.color100, t),
      color200: Color.lerp(color200, other?.color200, t),
      color300: Color.lerp(color300, other?.color300, t),
      color400: Color.lerp(color400, other?.color400, t),
      color500: Color.lerp(color500, other?.color500, t),
      color600: Color.lerp(color600, other?.color600, t),
      color700: Color.lerp(color700, other?.color700, t),
    );
  }
}
