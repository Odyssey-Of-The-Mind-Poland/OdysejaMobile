import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:odyssey_mobile/config/ootm_icons.dart';
import 'package:odyssey_mobile/design_system/icons/pattern_glyph.dart';
import 'package:odyssey_mobile/design_system/accent.dart';
import 'package:odyssey_mobile/design_system/components/schedule_tile.dart';

import 'test_host.dart';

void main() {
  testWidgets('shows number and title and has the size from the design', (tester) async {
    await tester.pumpWidget(themed(
      const ScheduleTile(number: '3', title: 'Problem 3', glyph: PatternGlyph.font(OotmIcons.map), color: AccentColor.orange),
    ));

    expect(find.text('3'), findsOneWidget);
    expect(find.text('Problem 3'), findsOneWidget);
    expect(tester.getSize(find.byType(ScheduleTile)), ScheduleTile.size);
  });

  testWidgets('badge hugs its label and a long title wraps to two lines', (tester) async {
    const title = 'Nauka na wesoło z bardzo długą nazwą kategorii';
    await tester.pumpWidget(themed(
      const ScheduleTile(
        number: 'II',
        title: title,
        glyph: PatternGlyph.font(OotmIcons.map),
        color: AccentColor.blue,
      ),
    ));

    final badge = tester.getSize(find.ancestor(of: find.text('II'), matching: find.byType(Container)).first);
    expect(badge.width, lessThan(60));
    expect(tester.getSize(find.text(title)).height, greaterThan(30));
    expect(tester.takeException(), isNull);
  });

  testWidgets('locked tile ignores taps', (tester) async {
    var taps = 0;
    await tester.pumpWidget(themed(
      ScheduleTile(
        number: '1',
        title: 'Problem 1',
        glyph: PatternGlyph.font(OotmIcons.map),
        color: AccentColor.blue,
        locked: true,
        onTap: () => taps++,
      ),
    ));

    await tester.tap(find.byType(ScheduleTile));
    expect(taps, 0);
    expect(find.byIcon(OotmIcons.lock), findsOneWidget);
  });

  testWidgets('unlocked tile reacts to taps and has no lock', (tester) async {
    var taps = 0;
    await tester.pumpWidget(themed(
      ScheduleTile(
        number: '1',
        title: 'Problem 1',
        glyph: PatternGlyph.font(OotmIcons.map),
        color: AccentColor.blue,
        onTap: () => taps++,
      ),
    ));

    await tester.tap(find.byType(ScheduleTile));
    expect(taps, 1);
    expect(find.byIcon(OotmIcons.lock), findsNothing);
  });
}
