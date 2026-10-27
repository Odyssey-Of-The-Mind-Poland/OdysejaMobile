import 'package:flutter/material.dart';
import 'package:path_drawing/path_drawing.dart';
import 'package:odyssey_mobile/design_system/icons/category_icon_paths.dart';

/// Something that can be drawn repeatedly as the background pattern of a tile.
///
/// [stroke] is the outline colour and [fill] the duotone body of the icon, as in the design.
abstract class PatternGlyph {
  const PatternGlyph();

  /// A glyph of an icon font; drawn in the [stroke] colour only.
  const factory PatternGlyph.font(IconData icon) = FontPatternGlyph;

  /// An icon selected by the server-side key, e.g. `map-01`. Unknown keys resolve to the default.
  factory PatternGlyph.category(String? key) = CategoryGlyph.of;

  /// Paints the glyph centred at [center], fitting a [size] x [size] box.
  void paint(Canvas canvas, Offset center, double size, {required Color stroke, required Color fill});
}

class FontPatternGlyph extends PatternGlyph {
  const FontPatternGlyph(this.icon);

  final IconData icon;

  @override
  void paint(Canvas canvas, Offset center, double size, {required Color stroke, required Color fill}) {
    final painter = TextPainter(
      textDirection: TextDirection.ltr,
      text: TextSpan(
        text: String.fromCharCode(icon.codePoint),
        style: TextStyle(
          fontSize: size,
          fontFamily: icon.fontFamily,
          package: icon.fontPackage,
          color: stroke,
          height: 1,
        ),
      ),
    )..layout();
    painter.paint(canvas, center - Offset(painter.width / 2, painter.height / 2));
  }

  @override
  bool operator ==(Object other) => other is FontPatternGlyph && other.icon == icon;

  @override
  int get hashCode => icon.hashCode;
}

/// Duotone line icon built from SVG path data (24x24), identified by a server-side key.
class CategoryGlyph extends PatternGlyph {
  const CategoryGlyph._(this.key, this._paths);

  /// Key used when the server sends an unknown or missing icon name.
  static const defaultKey = 'info-circle';

  static final _cache = <String, CategoryGlyph>{};

  factory CategoryGlyph.of(String? key) {
    final resolved = categoryIconPaths.containsKey(key) ? key! : defaultKey;
    return _cache.putIfAbsent(resolved, () {
      final paths = [for (final data in categoryIconPaths[resolved]!) parseSvgPathData(data)];
      return CategoryGlyph._(resolved, paths);
    });
  }

  /// All icon keys the app can draw.
  static Iterable<String> get keys => categoryIconPaths.keys;

  final String key;
  final List<Path> _paths;

  static const _viewBox = 24.0;
  static const _strokeWidth = 2.0;

  @override
  void paint(Canvas canvas, Offset center, double size, {required Color stroke, required Color fill}) {
    final scale = size / _viewBox;
    canvas
      ..save()
      ..translate(center.dx - size / 2, center.dy - size / 2)
      ..scale(scale);

    final fillPaint = Paint()
      ..style = PaintingStyle.fill
      ..color = fill;
    final strokePaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = _strokeWidth
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round
      ..color = stroke;

    for (final path in _paths) {
      canvas.drawPath(path, fillPaint);
      canvas.drawPath(path, strokePaint);
    }
    canvas.restore();
  }

  @override
  bool operator ==(Object other) => other is CategoryGlyph && other.key == key;

  @override
  int get hashCode => key.hashCode;
}
