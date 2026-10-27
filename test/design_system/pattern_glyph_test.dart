import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:odyssey_mobile/design_system/components/accent_pattern.dart';
import 'package:odyssey_mobile/design_system/icons/pattern_glyph.dart';

import 'test_host.dart';

void main() {
  test('every icon key the admin panel offers parses and paints', () {
    expect(CategoryGlyph.keys.length, greaterThanOrEqualTo(60));
    for (final key in CategoryGlyph.keys) {
      final recorder = PictureRecorder();
      final canvas = Canvas(recorder);

      expect(
        () => CategoryGlyph.of(key).paint(
          canvas,
          const Offset(14, 14),
          21,
          stroke: Colors.blue,
          fill: Colors.lightBlue,
        ),
        returnsNormally,
        reason: key,
      );
      recorder.endRecording();
    }
  });

  test('unknown or missing keys resolve to the default icon', () {
    expect(CategoryGlyph.of('not-an-icon'), CategoryGlyph.of(CategoryGlyph.defaultKey));
    expect(CategoryGlyph.of(null), CategoryGlyph.of(CategoryGlyph.defaultKey));
    expect(PatternGlyph.category('nope'), CategoryGlyph.of(CategoryGlyph.defaultKey));
  });

  test('resolving the same key twice reuses the parsed paths', () {
    expect(identical(CategoryGlyph.of('map-01'), CategoryGlyph.of('map-01')), isTrue);
  });

  test('different keys are different glyphs', () {
    expect(CategoryGlyph.of('map-01') == CategoryGlyph.of('home-02'), isFalse);
  });

  testWidgets('pattern repaints when the glyph changes', (tester) async {
    await tester.pumpWidget(themed(SizedBox(
      width: 164,
      height: 80,
      child: AccentPattern(glyph: PatternGlyph.category('map-01'), color: Colors.blue),
    )));
    await tester.pumpWidget(themed(SizedBox(
      width: 164,
      height: 80,
      child: AccentPattern(glyph: PatternGlyph.category('home-02'), color: Colors.blue),
    )));

    expect(tester.takeException(), isNull);
  });

  testWidgets('pattern does not swallow touches meant for the content below it', (tester) async {
    var taps = 0;
    await tester.pumpWidget(themed(GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => taps++,
      child: SizedBox(
        width: 100,
        height: 100,
        child: AccentPattern(glyph: PatternGlyph.category('trophy-01'), color: Colors.blue),
      ),
    )));

    await tester.tap(find.byType(GestureDetector));
    expect(taps, 1);
  });
}
