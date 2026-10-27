import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:odyssey_mobile/app/themes/theme.dart';
import 'package:odyssey_mobile/design_system/accent.dart';

void main() {
  group('AccentColor.fromKey', () {
    test('parses every key the backend can send', () {
      for (final color in AccentColor.values) {
        expect(AccentColor.fromKey(color.key), color);
      }
    });

    test('is case insensitive', () {
      expect(AccentColor.fromKey('Purple'), AccentColor.purple);
    });

    test('falls back for unknown and missing values', () {
      expect(AccentColor.fromKey('magenta'), AccentColor.blue);
      expect(AccentColor.fromKey(null), AccentColor.blue);
      expect(AccentColor.fromKey(null, fallback: AccentColor.red), AccentColor.red);
    });
  });

  group('AccentSurfaceTheme', () {
    test('resolves every accent in both themes', () {
      for (final theme in [themeLight, themeDark]) {
        for (final color in AccentColor.values) {
          expect(theme.accents[color], isNotNull);
        }
      }
    });

    test('light mode uses the pale tint as background and the strong shade as foreground', () {
      final blue = themeLight.accents[AccentColor.blue];

      expect(blue.background, const Color(0xFFE7F3FF));
      expect(blue.border, const Color(0xFFC4E1FD));
      expect(blue.foreground, const Color(0xFF228AF2));
    });

    test('dark mode inverts the relation', () {
      final blue = themeDark.accents[AccentColor.blue];

      expect(blue.background, const Color(0xFF1D4A6F));
      expect(blue.border, const Color(0xFF275E8B));
      expect(blue.foreground, const Color(0xFFE8F2FF));
    });

    test('foreground keeps readable contrast on the background in both themes', () {
      for (final theme in [themeLight, themeDark]) {
        for (final color in AccentColor.values) {
          final surface = theme.accents[color];
          final contrast = _contrast(surface.foreground, surface.background);
          expect(contrast, greaterThan(3.0), reason: '${theme.brightness} ${color.name}');
        }
      }
    });
  });
}

double _contrast(Color a, Color b) {
  final la = a.computeLuminance();
  final lb = b.computeLuminance();
  final hi = la > lb ? la : lb;
  final lo = la > lb ? lb : la;
  return (hi + 0.05) / (lo + 0.05);
}
