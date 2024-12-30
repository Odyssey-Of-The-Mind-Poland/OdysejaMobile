import 'dart:ui';

import 'package:odyssey_mobile/consts/hex_color.dart';

import 'colors.dart';

class LightColors implements Colors {

  static final LightColors appColors = LightColors._();

  LightColors._();


  @override
  final UniversalColors universal = UniversalColors(
    grey: ColorSet(
      color100: HexColor.fromHex('#FFFFFF'),
      color200: HexColor.fromHex('#F9FAFB'),
      color300: HexColor.fromHex('#EDEDED'),
      color400: HexColor.fromHex('#808489'),
      color500: HexColor.fromHex('#3C3E40'),
      color600: HexColor.fromHex('#292B2D'),
      color700: HexColor.fromHex('#202224'),
    ),
    blue: ColorSet(
      color100: HexColor.fromHex('#E4FCEC'),
      color200: HexColor.fromHex('#AAEDC2'),
      color300: HexColor.fromHex('#78D8A1'),
      color500: HexColor.fromHex('#2D9C5A'),
      color700: HexColor.fromHex('#18513A'),
    ),
    green: ColorSet(
      color100: HexColor.fromHex('#E8F5E9'),
      color200: HexColor.fromHex('#C8E6C9'),
      color300: HexColor.fromHex('#A5D6A7'),
      color400: HexColor.fromHex('#81C784'),
      color500: HexColor.fromHex('#66BB6A'),
      color600: HexColor.fromHex('#4CAF50'),
      color700: HexColor.fromHex('#43A047'),
    ),
    red: ColorSet(
      color100: HexColor.fromHex('#FBE7E7'),
      color200: HexColor.fromHex('#F3AAAB'),
      color300: HexColor.fromHex('#D83236'),
      color500: HexColor.fromHex('#B52226'),
      color700: HexColor.fromHex('#5F191B'),
    ),
  );

  @override
  final ColorSet primary = ColorSet(
    color100: HexColor.fromHex('#FFEFDD'),
    color200: HexColor.fromHex('#FFD8AC'),
    color300: HexColor.fromHex('#FF8800'),
    color500: Color.fromRGBO(238, 127, 0, 1),
    color700: Color.fromRGBO(227, 121, 0, 1),
  );

  @override
  final AccentColors accent = AccentColors(
    blue: ColorSet(
      color100: HexColor.fromHex('#E7F3FF'),
      color300: HexColor.fromHex('#E1F0FE'),
      color400: HexColor.fromHex('#D0E7FD'),
      color500: HexColor.fromHex('#C4E1FD'),
      color700: HexColor.fromHex('#228AF2'),
    ),
    orange: ColorSet(
      color100: HexColor.fromHex('#FFF1DE'),
      color300: HexColor.fromHex('#FFEDD9'),
      color400: HexColor.fromHex('#FFE1CB'),
      color500: HexColor.fromHex('#FFDCC2'),
      color700: HexColor.fromHex('#F24D06'),
    ),
    red: ColorSet(
      color100: HexColor.fromHex('#FFDADA'),
      color300: HexColor.fromHex('#FFDADA'),
      color400: HexColor.fromHex('#FDCDCD'),
      color500: HexColor.fromHex('#FDC4C4'),
      color700: HexColor.fromHex('#F42F2F'),
    ),
    purple: ColorSet(
      color100: HexColor.fromHex('#EEEAFF'),
      color300: HexColor.fromHex('#EAE5FE'),
      color400: HexColor.fromHex('#DCD5FD'),
      color500: HexColor.fromHex('#D7CFFC'),
      color600: HexColor.fromHex('#4CAF50'),
      color700: HexColor.fromHex('#6E52F4'),
    ),
  );
}
