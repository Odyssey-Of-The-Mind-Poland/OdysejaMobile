import 'package:flutter/material.dart';
import 'package:odyssey_mobile/app/themes/theme.dart';

final themeLight = ThemeData(
  brightness: Brightness.light,
  fontFamily: _fontFamily,
  splashFactory: NoSplash.splashFactory,
  highlightColor: _colors.universal.grey.color300,
  scaffoldBackgroundColor: _colors.universal.grey.color200,
  iconTheme: IconThemeData(size: 22, color: _colors.universal.grey.color400),

  /// Used with [TopBar]
  appBarTheme: AppBarTheme(
    actionsPadding: EdgeInsets.symmetric(horizontal: 16),
    elevation: 0,
    titleTextStyle: _typography.h2,
    backgroundColor: _colors.universal.grey.color100,
    surfaceTintColor: Colors.transparent,
    centerTitle: false,
    shape: Border(
      bottom: BorderSide(width: 2, color: _colors.universal.grey.color300 ?? _borderColorFallback),
    ),
  ),
  extensions: [
    _colors,
    _typography,
    appStyling,
    _navigationBar,
    _buttons,
    _bottomSheet,
    _common,
    _topBar,
  ],
);

const _borderColorFallback = Color(0xFF3C3E40);

final _topBar = TopBarTheme(
  actionForeground: _colors.universal.grey.color400,
  actionBackground: _colors.universal.grey.color200?.withValues(alpha: 0.64),
  actionBorder: _colors.universal.grey.color300,
  actionForegroundPressed: _colors.universal.grey.color400,
  actionBorderPressed: _colors.universal.grey.color100,
);

final _common = OotmCommonTheme(
  surfaceColor: _colors.universal.grey.color100,
  borderColor: _colors.universal.grey.color300,
  primaryColor: _colors.primary.color500,
  textLighterColor: _colors.universal.grey.color400,
  searchFieldCancelColor: _colors.universal.grey.color400,
);

final _bottomSheet = OotmBottomSheetTheme(
  handleColor: _colors.universal.grey.color200,
  backgroundColor: _colors.universal.grey.color100,
  borderColor: _colors.universal.grey.color300,
  closeButtonBackground: _colors.universal.grey.color300,
  closeButtonForeground: _colors.universal.grey.color400,
  closeButtonHighlight: _colors.universal.grey.color400?.withValues(alpha: 0.5),
);

final _buttons = OotmMainButtonTheme(
  primaryBackground: _colors.primary.color500,
  primaryBorder: _colors.primary.color700,
  primaryHighlight: _colors.primary.color700,
  primaryForeground: _colors.universal.grey.color200,
  secondaryDefault: _colors.primary.color500,
  secondaryPressed: _colors.primary.color700,
  tertiaryForeground: _colors.universal.grey.color700,
  tertiaryBackground: _colors.universal.grey.color200,
  tertiaryBorder: _colors.universal.grey.color300,
  tertiaryHighlight: _colors.universal.grey.color300,
  tertiaryForegroundSelected: _colors.universal.grey.color200,
  tertiaryBackgroundSelected: _colors.primary.color500,
  tertiaryBorderSelected: _colors.primary.color700,
  tertiaryHighlightSelected: _colors.primary.color700,
);

final _navigationBar = OotmNavigationBarThemeData(
  iconColor: _colors.universal.grey.color400,
  iconColorSelected: _colors.primary.color700,
  colorBackground: _colors.universal.grey.color100,
  borderColor: _colors.universal.grey.color300,
  highlightColor: _colors.primary.color200,
  indicatorBorderColor: _colors.primary.color200,
  indicatorColor: _colors.primary.color100,
);

const _colors = AppColors(
  universal: colorsUniversal,
  primary: ColorSet(
    color100: Color(0xFFFFEFDD),
    color200: Color(0xFFFFD8AC),
    color300: Color(0xFFFF8800),
    color500: Color(0xFFEE7F00),
    color700: Color(0xFFE37900),
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
      color100: Color(0xFFFFDEDE),
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
      color700: Color(0xFF6E52F4),
    ),
    green: ColorSet(
      color100: Color(0xFFECFADB),
      color300: Color(0xFFE7F8D1),
      color400: Color(0xFFD7F3B5),
      color500: Color(0xFFD2F1AC),
      color700: Color(0xFF5B9315),
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
    fontWeight: FontWeight.w500,
    color: _fontColorDefault,
  ),
  bodySmallRegular: TextStyle(
    fontFamily: _fontFamily,
    fontSize: 12,
    height: 1.667,
    fontWeight: FontWeight.w400,
    color: _fontColorDefault,
  ),
);
