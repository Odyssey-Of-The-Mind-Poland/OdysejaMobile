import 'dart:ui';

import 'package:odyssey_mobile/app/themes/theme_extensions.dart';

@Deprecated('Obsolete. Migrate to theme extensions')
class LightColors {
  static final LightColors appColors = LightColors._();

  LightColors._();

  final UniversalColors universal = UniversalColors(
    grey: ColorSet(
      color100: Color(0xFFFFFFFF),
      color200: Color(0xFFF9FAFB),
      color300: Color(0xFFEDEDED),
      color400: Color(0xFF808489),
      color500: Color(0xFF3C3E40),
      color600: Color(0xFF292B2D),
      color700: Color(0xFF202224),
    ),
    blue: ColorSet(
      color100: Color(0xFFE4FCEC),
      color200: Color(0xFFAAEDC2),
      color300: Color(0xFF78D8A1),
      color500: Color(0xFF2D9C5A),
      color700: Color(0xFF18513A),
    ),
    green: ColorSet(
      color100: Color(0xFFE8F5E9),
      color200: Color(0xFFC8E6C9),
      color300: Color(0xFFA5D6A7),
      color400: Color(0xFF81C784),
      color500: Color(0xFF66BB6A),
      color600: Color(0xFF4CAF50),
      color700: Color(0xFF43A047),
    ),
    red: ColorSet(
      color100: Color(0xFFFBE7E7),
      color200: Color(0xFFF3AAAB),
      color300: Color(0xFFD83236),
      color500: Color(0xFFB52226),
      color700: Color(0xFF5F191B),
    ),
  );

  final ColorSet primary = ColorSet(
    color100: Color(0xFFFFEFDD),
    color200: Color(0xFFFFD8AC),
    color300: Color(0xFFFF8800),
    color500: Color.fromRGBO(238, 127, 0, 1),
    color700: Color.fromRGBO(227, 121, 0, 1),
  );

  final AccentColors accent = AccentColors(
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
    green: ColorSet(
      color100: Color(0xFFECFADB),
      color300: Color(0xFFE7F8D1),
      color400: Color(0xFFD7F3B5),
      color500: Color(0xFFD2F1AC),
      color700: Color(0xFF5B9315),
    ),
  );
}
