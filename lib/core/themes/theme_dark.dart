import 'package:flutter/material.dart';
import 'package:odyssey_mobile/core/themes/theme.dart';

final themeDark = ThemeData(
  brightness: Brightness.dark,
  fontFamily: _fontFamily,
  splashFactory: NoSplash.splashFactory,
  highlightColor: _colors.universal.grey.color500,
  iconTheme: IconThemeData(size: 22),
  extensions: [
    _colors,
    _typography,
    appStyling,
    _navigationBar,
  ],
);

final _navigationBar = OotmNavigationBarThemeData(
  iconColor: _colors.universal.grey.color300,
  iconColorSelected: _colors.primary.color700,
  colorBackground: _colors.universal.grey.color600,
  borderColor: _colors.universal.grey.color500,
  highlightColor: _colors.primary.color200,
  indicatorBorderColor: _colors.primary.color200,
  indicatorColor: _colors.primary.color100,
);

const _colors = AppColors(
  universal: colorsUniversal,
  primary: ColorSet(
    color100: Color(0xFFFCC573),
    color200: Color(0xFFFFB662),
    color300: Color(0xFFFF8800),
    color500: Color(0xFFC86B00),
    color700: Color(0xFF883600),
  ),
  accent: AccentColors(
    blue: ColorSet(
      color100: Color(0xFFE8F2FF),
      color300: Color(0xFF3877AE),
      color400: Color(0xFF275E8B),
      color500: Color(0xFF235680),
      color700: Color(0xFF1D4A6F),
    ),
    orange: ColorSet(
      color100: Color(0xFFFFEEE0),
      color300: Color(0xFFA06427),
      color400: Color(0xFF804D19),
      color500: Color(0xFF764715),
      color700: Color(0xFF663D11),
    ),
    red: ColorSet(
      color100: Color(0xFFFFECE9),
      color300: Color(0xFFAC5859),
      color400: Color(0xFF894344),
      color500: Color(0xFF833B3D),
      color700: Color(0xFF743032),
    ),
    purple: ColorSet(
      color100: Color(0xFFF3EDFF),
      color300: Color(0xFF7469BA),
      color400: Color(0xFF574D98),
      color500: Color(0xFF514695),
      color700: Color(0xFF453A88),
    ),
    green: ColorSet(
      color100: Color(0xFFDBFEA8),
      color300: Color(0xFF617F39),
      color400: Color(0xFF476322),
      color500: Color(0xFF3F5B1A),
      color700: Color(0xFF354F12),
    ),
  ),
);

/// Verbose definitions of TextStyles are required for intuitive ThemeData behaviour.
/// Without [color] field, injecting [AppTypography] fields directly to ThemeData
/// results in displaying fallback color.
///
/// Flutter 3.29.0
const _fontColorDefault = Color(0xFFFFFFFF);

/// Verbose definitions of TextStyles are required for intuitive ThemeData behaviour.
/// Without [fontFamily] field, injecting [AppTypography] fields directly to ThemeData
/// results in displaying fallback font family.
///
/// Flutter 3.29.0
const _fontFamily = 'Ubuntu';

const _typography = AppTypography(
  h1: TextStyle(
    fontFamily: _fontFamily,
    fontSize: 32,
    height: 1.375,
    fontWeight: FontWeight.w700,
    color: _fontColorDefault,
  ),
  h2: TextStyle(
    fontFamily: _fontFamily,
    fontSize: 24,
    height: 1.5,
    fontWeight: FontWeight.w700,
    color: _fontColorDefault,
  ),
  h3: TextStyle(
    fontFamily: _fontFamily,
    fontSize: 20,
    height: 1.6,
    fontWeight: FontWeight.w500,
    color: _fontColorDefault,
  ),
  bodyLargeBold: TextStyle(
    fontFamily: _fontFamily,
    fontSize: 16,
    height: 1.75,
    fontWeight: FontWeight.w500,
    color: _fontColorDefault,
  ),
  bodyLargeRegular: TextStyle(
    fontFamily: _fontFamily,
    fontSize: 16,
    height: 1.75,
    fontWeight: FontWeight.w400,
    color: _fontColorDefault,
  ),
  bodyMediumBold: TextStyle(
    fontFamily: _fontFamily,
    fontSize: 14,
    height: 1.714,
    fontWeight: FontWeight.w500,
    color: _fontColorDefault,
  ),
  bodyMediumRegular: TextStyle(
    fontFamily: _fontFamily,
    fontSize: 14,
    height: 1.714,
    fontWeight: FontWeight.w300,
    color: _fontColorDefault,
  ),
  bodySmallBold: TextStyle(
    fontFamily: _fontFamily,
    fontSize: 12,
    height: 1.667,
    fontWeight: FontWeight.w400,
    color: _fontColorDefault,
  ),
  bodySmallRegular: TextStyle(
    fontFamily: _fontFamily,
    fontSize: 12,
    height: 1.667,
    fontWeight: FontWeight.w500,
    color: _fontColorDefault,
  ),
);
