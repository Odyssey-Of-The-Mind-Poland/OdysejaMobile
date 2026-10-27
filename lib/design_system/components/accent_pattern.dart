import 'dart:math' as math;

import 'package:flutter/material.dart';

/// Decorative background of tiles: a brick-like grid of one icon, rotated by 16 degrees
/// and centered on the tile, as in the "Master Pattern" of the design.
///
/// The icon is a font glyph, so any [IconData] (including ones coming from
/// server-side category definitions) can be drawn and tinted without assets.
class AccentPattern extends StatelessWidget {
  const AccentPattern({
    required this.icon,
    required this.color,
    this.cellSize = 28,
    this.spacing = 28,
    super.key,
  });

  final IconData icon;
  final Color color;

  /// Size of a single glyph.
  final double cellSize;

  /// Distance between neighbouring glyphs in a row. Rows are [spacing] apart and every
  /// other row is shifted by half of it, like bricks.
  final double spacing;

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: ExcludeSemantics(
        child: CustomPaint(
          painter: AccentPatternPainter(icon: icon, color: color, cellSize: cellSize, spacing: spacing),
          size: Size.infinite,
        ),
      ),
    );
  }
}

class AccentPatternPainter extends CustomPainter {
  AccentPatternPainter({
    required this.icon,
    required this.color,
    required this.cellSize,
    required this.spacing,
  });

  final IconData icon;
  final Color color;
  final double cellSize;
  final double spacing;

  static const rotation = 16 * math.pi / 180;

  @override
  void paint(Canvas canvas, Size size) {
    if (size.isEmpty) return;

    final glyph = TextPainter(
      textDirection: TextDirection.ltr,
      text: TextSpan(
        text: String.fromCharCode(icon.codePoint),
        style: TextStyle(
          fontSize: cellSize,
          fontFamily: icon.fontFamily,
          package: icon.fontPackage,
          color: color,
          height: 1,
        ),
      ),
    )..layout();

    canvas.clipRect(Offset.zero & size);
    canvas.translate(size.width / 2, size.height / 2);
    canvas.rotate(rotation);

    // Every glyph must be able to land inside the (rotated) viewport, so the
    // grid is covered up to the half of its diagonal in every direction.
    final reach = size.longestSide / 2 + cellSize;
    final rows = (reach / spacing).ceil();
    for (var row = -rows; row <= rows; row++) {
      final shift = row.isEven ? spacing / 2 : 0.0;
      final columns = (reach / spacing).ceil();
      for (var column = -columns; column <= columns; column++) {
        final center = Offset(column * spacing + shift, row * spacing);
        glyph.paint(canvas, center - Offset(glyph.width / 2, glyph.height / 2));
      }
    }
  }

  @override
  bool shouldRepaint(AccentPatternPainter old) =>
      old.icon != icon ||
      old.color != color ||
      old.cellSize != cellSize ||
      old.spacing != spacing;
}
