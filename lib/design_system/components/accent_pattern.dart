import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:odyssey_mobile/design_system/icons/pattern_glyph.dart';

/// Decorative background of tiles: a brick-like grid of one glyph, rotated by 16 degrees
/// and centered on the tile, as in the "Master Pattern" of the design.
///
/// The glyph may come from the server (see [PatternGlyph.category]), so any category icon can be
/// drawn and tinted without assets. [color] is the outline and [fillColor] the duotone body.
class AccentPattern extends StatelessWidget {
  const AccentPattern({
    required this.glyph,
    required this.color,
    this.fillColor,
    this.cellSize = 28,
    this.spacing = 28,
    super.key,
  });

  final PatternGlyph glyph;
  final Color color;

  /// Body of the glyph; defaults to a translucent [color].
  final Color? fillColor;

  /// Size of a single cell.
  final double cellSize;

  /// Distance between neighbouring glyphs in a row. Rows are [spacing] apart and every
  /// other row is shifted by half of it, like bricks.
  final double spacing;

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: ExcludeSemantics(
        child: CustomPaint(
          painter: AccentPatternPainter(
            glyph: glyph,
            color: color,
            fillColor: fillColor ?? color.withValues(alpha: 0.4),
            cellSize: cellSize,
            spacing: spacing,
          ),
          size: Size.infinite,
        ),
      ),
    );
  }
}

class AccentPatternPainter extends CustomPainter {
  AccentPatternPainter({
    required this.glyph,
    required this.color,
    required this.fillColor,
    required this.cellSize,
    required this.spacing,
  });

  final PatternGlyph glyph;
  final Color color;
  final Color fillColor;
  final double cellSize;
  final double spacing;

  static const rotation = 16 * math.pi / 180;

  /// Glyphs are drawn smaller than their cell so the pattern stays airy and does not compete
  /// with the content on top of it (the design's glyphs are ~21px in a 28px cell).
  static const glyphScale = 0.75;

  @override
  void paint(Canvas canvas, Size size) {
    if (size.isEmpty) return;

    canvas.clipRect(Offset.zero & size);
    canvas.translate(size.width / 2, size.height / 2);
    canvas.rotate(rotation);

    // Every glyph must be able to land inside the (rotated) viewport, so the
    // grid is covered up to the half of its diagonal in every direction.
    final reach = size.longestSide / 2 + cellSize;
    final rows = (reach / spacing).ceil();
    final columns = (reach / spacing).ceil();
    for (var row = -rows; row <= rows; row++) {
      final shift = row.isEven ? spacing / 2 : 0.0;
      for (var column = -columns; column <= columns; column++) {
        final center = Offset(column * spacing + shift, row * spacing);
        glyph.paint(canvas, center, cellSize * glyphScale, stroke: color, fill: fillColor);
      }
    }
  }

  @override
  bool shouldRepaint(AccentPatternPainter old) =>
      old.glyph != glyph ||
      old.color != color ||
      old.fillColor != fillColor ||
      old.cellSize != cellSize ||
      old.spacing != spacing;
}
