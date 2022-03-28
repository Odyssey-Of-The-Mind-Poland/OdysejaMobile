import 'package:flutter/material.dart';

final lightTheme = ThemeData(
  fontFamily: 'Ubuntu',
  primaryColor: AppColors.primaryOrange,
  scaffoldBackgroundColor: AppColors.lightestGrey,
  appBarTheme: const AppBarTheme(
    elevation: 0,
    toolbarHeight: 64,
    titleTextStyle: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w700,
      letterSpacing: 0.25,
      color: AppColors.darkestGrey,
    ),
    backgroundColor: AppColors.lightestGrey,
    iconTheme: IconThemeData(color: AppColors.darkestGrey),
    actionsIconTheme: IconThemeData(color: AppColors.darkestGrey),
  ),
  tabBarTheme: const TabBarTheme(
    labelPadding: EdgeInsets.symmetric(vertical: 8.0),
    labelStyle: AppTextStyles.h3,
    unselectedLabelStyle: AppTextStyles.h3,
    labelColor: AppColors.darkestGrey,
    unselectedLabelColor: AppColors.mediumGrey,
    indicator: UnderlineTabIndicator(
      insets: EdgeInsets.symmetric(horizontal: 48.0),
      borderSide: BorderSide(width: 4, color: AppColors.primaryOrange),
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
    primary: AppColors.primaryOrange,
    textStyle: AppTextStyles.button,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppValues.defaultBrRadius)),
    minimumSize: const Size(0, 40),
  )),
);

abstract class AppTextStyles {
  static const h0 = TextStyle(
      fontSize: 40,
      fontWeight: FontWeight.w700,
      letterSpacing: 0.25,
      color: AppColors.primaryOrange);
  static const h1 = TextStyle(fontSize: 32, fontWeight: FontWeight.w700, letterSpacing: 0.25);
  static const h2 = TextStyle(fontSize: 24, fontWeight: FontWeight.w700, letterSpacing: 0.0);
  static const h3special =
      TextStyle(fontSize: 20, fontWeight: FontWeight.w700, letterSpacing: 0.15);
  static const h3 = TextStyle(fontSize: 16, fontWeight: FontWeight.w700, letterSpacing: 0.15);
  static const h3White = TextStyle(
      fontSize: 16, fontWeight: FontWeight.w700, letterSpacing: 0.15, color: AppColors.pureWhite);
  static const h4 = TextStyle(fontSize: 14, fontWeight: FontWeight.w700, letterSpacing: 0.1);
  static const h4orange = TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w700,
      letterSpacing: 0.1,
      color: AppColors.primaryOrange);
  static const subtitleWhite = TextStyle(
      fontSize: 14, fontWeight: FontWeight.w500, letterSpacing: 0.1, color: AppColors.pureWhite);
  static const subtitle1 = TextStyle(fontSize: 14, fontWeight: FontWeight.w500, letterSpacing: 0.1);
  static const bodyText1 =
      TextStyle(fontSize: 14, fontWeight: FontWeight.w300, letterSpacing: 0.25);
  static const bodyText2 = TextStyle(fontSize: 16, fontWeight: FontWeight.w300, letterSpacing: 0.5);
  static const button = TextStyle(fontSize: 16, fontWeight: FontWeight.w700, letterSpacing: 1.25);
  static const caption = TextStyle(fontSize: 10, fontWeight: FontWeight.w400, letterSpacing: 0.4);
}

abstract class AppColors {
  static const halfOrange = Color(0x88FF951A);
  static const primaryOrange = Color(0xFFFF951A);
  static const lightOrange = Color(0xFFFFAE51);
  static const lightestOrange = Color(0xFFFFDDB5);

  static const darkestGrey = Color(0xFF222222);
  static const darkGrey = Color(0xFF8F8F8F);
  static const mediumGrey = Color(0xFFCBCBCB);
  static const lightGrey = Color(0xFFE8E8E8);
  static const lightestGrey = Color(0xFFFAFAFA);
  static const pureWhite = Color(0xFFFFFFFF);
  static const shadowGrey = Color(0x15222222);
  static const scrimGrey = Color(0xA4222222);

  static const darkGreen = Color(0xFF2D9C5A);
  static const lightestGreen = Color(0xFFE4FCEC);

  static const darkestBlue = Color(0xFF164577);
  static const darkBlue = Color(0xFF3373B7);
  static const mediumBlue = Color(0xFF2381E5);
  static const lightBlue = Color(0xFF80BDFE);
  static const lightestBlue = Color(0xFFDDEDFF);

  // aditional colors after review
  static const omerBlue = Color(0xFF110329);
  static const mdHeadlineBlue = Color(0xFF3C4AA5);

  static const gradientBlue = LinearGradient(
      colors: [Color(0xFF2073AD), Color(0xFF00B1EB)],
      end: Alignment.topRight,
      begin: Alignment.bottomLeft);

  static const gradientYellow = LinearGradient(
    colors: [Color(0xFFFEBA00), Color(0xFFFEE100)],
    end: Alignment.topRight,
    begin: Alignment.bottomLeft,
  );

  static const gradientRed = LinearGradient(
      colors: [Color(0xFFa61111), Color(0xFFE31E24)],
      end: Alignment.topRight,
      begin: Alignment.bottomLeft);

  static const gradientLightBlue = LinearGradient(
      colors: [Color(0xFF3373B7), Color(0xFF80BDFE), Color(0xFFDDEDFF)],
      end: Alignment.topRight,
      begin: Alignment.bottomLeft);

  static const gradientMediumBlue = LinearGradient(
      colors: [Color(0xFF2A458D), Color(0xFF2F4C9C), Color(0xFF4365C6)],
      end: Alignment.topRight,
      begin: Alignment.bottomLeft);

  static const gradientDarkBlue = LinearGradient(
      colors: [Color(0xFF17274E), Color(0xFF253E7D), Color(0xFF2F4E9D)],
      end: Alignment.topRight,
      begin: Alignment.bottomLeft);

  static const gradientOrange = LinearGradient(
      colors: [Color(0xFFEC7F00), Color(0xFFFF951A), Color(0xFFFFDDB5)],
      end: Alignment.topRight,
      begin: Alignment.bottomLeft);

  static const gradientGreen = LinearGradient(
      colors: [Color(0xFF4AB98D), Color(0xFF2CDA93), Color(0xFF53F3B2)],
      end: Alignment.topRight,
      begin: Alignment.bottomLeft);

  static const gradientPurple = LinearGradient(
      colors: [Color(0xFF360B77), Color(0xFF5A1BC7), Color(0xFF7225FB)],
      end: Alignment.topRight,
      begin: Alignment.bottomLeft);

  /// Use for dynamic content that can exceed [splashGradientPair.length].
  static SplashGradientPair safeSGPair(int value) =>
      _splashGradientMap[value] ??
      const SplashGradientPair(
          gradient: AppColors.gradientLightBlue, splashColor: AppColors.lightOrange);

  /// Use for hardcoded content that can will not exceed [splashGradientPair.length].
  static SplashGradientPair sGPair(int value) => _splashGradientMap[value]!;
}

abstract class AppValues {
  static const biggerBrRadius = 12.0;
  static const defaultBrRadius = 10.0;
  static const smallBrRadius = 5.0;
  static const ultraBrRadius = 32.0;
  static const defaultBoxDimension = 120.0;
  static const swipeTreshold = 0.3;
  static const defaultAnimationDuration = Duration(milliseconds: 330);
  static const longerAnimationDuration = Duration(milliseconds: 500);
}

const Map<int, SplashGradientPair> _splashGradientMap = {
  0: SplashGradientPair(gradient: AppColors.gradientLightBlue, splashColor: AppColors.lightOrange),
  1: SplashGradientPair(gradient: AppColors.gradientMediumBlue, splashColor: AppColors.lightOrange),
  2: SplashGradientPair(gradient: AppColors.gradientDarkBlue, splashColor: AppColors.lightOrange),
  3: SplashGradientPair(gradient: AppColors.gradientBlue, splashColor: AppColors.lightOrange),
  4: SplashGradientPair(gradient: AppColors.gradientYellow, splashColor: AppColors.lightOrange),
  5: SplashGradientPair(gradient: AppColors.gradientRed, splashColor: AppColors.lightOrange),
};

class SplashGradientPair {
  const SplashGradientPair({
    required this.gradient,
    required this.splashColor,
  });
  final Gradient gradient;
  final Color splashColor;
}
