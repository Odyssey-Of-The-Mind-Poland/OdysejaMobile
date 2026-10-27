import 'package:flutter/material.dart';

/// Colours of a performance the user added to favourites (schedule rows, favourites list).
///
/// Light mode paints a pale peach card with orange text; dark mode a bright orange card with
/// dark text, as in the design.
class FavouriteSurfaceTheme extends ThemeExtension<FavouriteSurfaceTheme> {
  const FavouriteSurfaceTheme({
    required this.background,
    required this.border,
    required this.time,
    required this.text,
    required this.pattern,
  });

  final Color background;
  final Color border;
  final Color time;
  final Color text;

  /// Colour of the heart pattern drawn behind the content.
  final Color pattern;

  @override
  FavouriteSurfaceTheme copyWith({
    Color? background,
    Color? border,
    Color? time,
    Color? text,
    Color? pattern,
  }) => FavouriteSurfaceTheme(
    background: background ?? this.background,
    border: border ?? this.border,
    time: time ?? this.time,
    text: text ?? this.text,
    pattern: pattern ?? this.pattern,
  );

  @override
  FavouriteSurfaceTheme lerp(FavouriteSurfaceTheme? other, double t) {
    if (other == null) return this;
    return FavouriteSurfaceTheme(
      background: Color.lerp(background, other.background, t)!,
      border: Color.lerp(border, other.border, t)!,
      time: Color.lerp(time, other.time, t)!,
      text: Color.lerp(text, other.text, t)!,
      pattern: Color.lerp(pattern, other.pattern, t)!,
    );
  }
}

extension FavouriteSurfaceLookup on ThemeData {
  FavouriteSurfaceTheme get favourite => extension<FavouriteSurfaceTheme>()!;
}
