import 'package:flutter/material.dart';
import 'package:odyssey_mobile/app/themes/theme.dart';

/// Pumps [child] under the app's light or dark theme.
Widget themed(Widget child, {Brightness brightness = Brightness.light, double width = 375}) {
  return MaterialApp(
    theme: themeLight,
    darkTheme: themeDark,
    themeMode: brightness == Brightness.dark ? ThemeMode.dark : ThemeMode.light,
    home: Scaffold(
      body: Center(child: SizedBox(width: width, child: Align(alignment: Alignment.topLeft, child: child))),
    ),
  );
}
