import 'package:flutter/material.dart';
import 'package:odyssey_mobile/app/themes/theme.dart';

/// Accent colours an info category (or schedule tile) can be tinted with.
///
/// [key] is the identifier exchanged with the backend, so it must stay stable.
/// The actual shades are resolved through [AccentSurfaceTheme], which is what
/// makes the same category look right in both light and dark mode.
enum AccentColor {
  blue,
  orange,
  purple,
  green,
  red;

  String get key => name;

  /// Parses a backend value. Unknown or missing values fall back to [fallback]
  /// so a category added server-side never breaks rendering in an older app.
  static AccentColor fromKey(String? key, {AccentColor fallback = AccentColor.blue}) =>
      AccentColor.values.asNameMap()[key?.toLowerCase()] ?? fallback;
}

/// Resolved colours of a surface (tile, top bar, icon button...) tinted with one accent.
class AccentSurface {
  const AccentSurface({
    required this.background,
    required this.border,
    required this.foreground,
    required this.pattern,
    required this.badgeBackground,
    required this.badgeForeground,
  });

  final Color background;
  final Color border;
  final Color foreground;

  /// Colour of the decorative icon pattern drawn behind the content.
  final Color pattern;
  final Color badgeBackground;
  final Color badgeForeground;

  AccentSurface lerp(AccentSurface other, double t) => AccentSurface(
        background: Color.lerp(background, other.background, t)!,
        border: Color.lerp(border, other.border, t)!,
        foreground: Color.lerp(foreground, other.foreground, t)!,
        pattern: Color.lerp(pattern, other.pattern, t)!,
        badgeBackground: Color.lerp(badgeBackground, other.badgeBackground, t)!,
        badgeForeground: Color.lerp(badgeForeground, other.badgeForeground, t)!,
      );
}

/// Accent surfaces for the current theme.
///
/// Light mode paints a pale tint (100) with a strong foreground (700);
/// dark mode inverts the relation: a deep background (700) with a pale foreground (100).
/// Read it with `Theme.of(context).accents[AccentColor.blue]`.
class AccentSurfaceTheme extends ThemeExtension<AccentSurfaceTheme> {
  const AccentSurfaceTheme(this._surfaces);

  factory AccentSurfaceTheme.light(AccentColors accent) => AccentSurfaceTheme({
        for (final color in AccentColor.values)
          color: () {
            final set = accent.of(color);
            return AccentSurface(
              background: set.color100!,
              border: set.color500!,
              foreground: set.color700!,
              pattern: set.color400!,
              badgeBackground: set.color700!,
              badgeForeground: const Color(0xFFFFFFFF),
            );
          }(),
      });

  factory AccentSurfaceTheme.dark(AccentColors accent) => AccentSurfaceTheme({
        for (final color in AccentColor.values)
          color: () {
            final set = accent.of(color);
            return AccentSurface(
              background: set.color700!,
              border: set.color400!,
              foreground: set.color100!,
              pattern: set.color500!,
              badgeBackground: set.color100!,
              badgeForeground: set.color700!,
            );
          }(),
      });

  final Map<AccentColor, AccentSurface> _surfaces;

  AccentSurface operator [](AccentColor color) => _surfaces[color]!;

  @override
  AccentSurfaceTheme copyWith() => AccentSurfaceTheme(Map.of(_surfaces));

  @override
  AccentSurfaceTheme lerp(AccentSurfaceTheme? other, double t) {
    if (other == null) return this;
    return AccentSurfaceTheme({
      for (final color in AccentColor.values) color: _surfaces[color]!.lerp(other[color], t),
    });
  }
}

extension AccentColorsLookup on AccentColors {
  ColorSet of(AccentColor color) => switch (color) {
        AccentColor.blue => blue,
        AccentColor.orange => orange,
        AccentColor.purple => purple,
        AccentColor.green => green,
        AccentColor.red => red,
      };
}

extension AccentThemeLookup on ThemeData {
  AccentSurfaceTheme get accents => extension<AccentSurfaceTheme>()!;
}
