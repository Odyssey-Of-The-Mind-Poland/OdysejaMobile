import 'package:flutter/material.dart';
import 'package:odyssey_mobile/consts/theme_common.dart';
import 'package:odyssey_mobile/consts/theme_extensions.dart';

final themeLight = ThemeData(
  brightness: Brightness.light,
  fontFamily: _fontFamily,
  extensions: [_colors, _typography, appStyling],
);

const _colors = AppColors(
  universal: colorsUniversal,
  primary: ColorSet(
    color100: Color(0xFFFFEFDD),
    color200: Color(0xFFFFD8AC),
    color300: Color(0xFFFF8800),
    color500: Color.fromRGBO(238, 127, 0, 1),
    color700: Color.fromRGBO(227, 121, 0, 1),
  ),
  accent: AccentColors(
    blue: ColorSet(
      color100: Color(0xFFE7F3FF),
      color300: Color(0xFFE1F0FE),
      color400: Color(0xFFD0E7FD),
      color500: Color(0xFFC4E1FD),
      color700: Color(0xFF228AF2),
    ),
    orange: ColorSet(
      color100: Color(0xFFFFF1DE),
      color300: Color(0xFFFFEDD9),
      color400: Color(0xFFFFE1CB),
      color500: Color(0xFFFFDCC2),
      color700: Color(0xFFF24D06),
    ),
    red: ColorSet(
      color100: Color(0xFFFFDADA),
      color300: Color(0xFFFFDADA),
      color400: Color(0xFFFDCDCD),
      color500: Color(0xFFFDC4C4),
      color700: Color(0xFFF42F2F),
    ),
    purple: ColorSet(
      color100: Color(0xFFEEEAFF),
      color300: Color(0xFFEAE5FE),
      color400: Color(0xFFDCD5FD),
      color500: Color(0xFFD7CFFC),
      color600: Color(0xFF4CAF50),
      color700: Color(0xFF6E52F4),
    ),
  ),
);

/// Verbose definitions of TextStyles are required for intuitive ThemeData behaviour.
/// Without [color] field, injecting [AppTypography] fields directly to ThemeData
/// results in displaying fallback color.
///
/// Flutter 3.29.0
const _fontColorDefault = Color(0xFF3C3E40);

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
