import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:odyssey_mobile/app/themes/theme.dart';
import 'package:odyssey_mobile/app/themes/theme_mode_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  group('ThemeModeCubit', () {
    test('defaults to light when nothing is stored', () async {
      SharedPreferences.setMockInitialValues({});
      final cubit = ThemeModeCubit(await SharedPreferences.getInstance());

      expect(cubit.state, ThemeMode.light);
    });

    test('restores the stored mode', () async {
      SharedPreferences.setMockInitialValues({ThemeModeCubit.storageKey: 'dark'});
      final cubit = ThemeModeCubit(await SharedPreferences.getInstance());

      expect(cubit.state, ThemeMode.dark);
    });

    test('falls back to the default for an unknown stored value', () async {
      SharedPreferences.setMockInitialValues({ThemeModeCubit.storageKey: 'sepia'});
      final cubit = ThemeModeCubit(await SharedPreferences.getInstance());

      expect(cubit.state, ThemeModeCubit.defaultMode);
    });

    test('persists the selected mode', () async {
      SharedPreferences.setMockInitialValues({});
      final prefs = await SharedPreferences.getInstance();
      final cubit = ThemeModeCubit(prefs);

      await cubit.setMode(ThemeMode.system);

      expect(cubit.state, ThemeMode.system);
      expect(prefs.getString(ThemeModeCubit.storageKey), 'system');
    });
  });

  group('theme definitions', () {
    test('light and dark themes expose the same extensions', () {
      expect(
        themeDark.extensions.keys.toSet(),
        themeLight.extensions.keys.toSet(),
        reason: 'a widget reading an extension must work in both modes',
      );
    });

    test('light and dark themes have matching brightness', () {
      expect(themeLight.brightness, Brightness.light);
      expect(themeDark.brightness, Brightness.dark);
    });
  });
}
