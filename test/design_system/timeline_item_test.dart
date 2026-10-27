import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:odyssey_mobile/app/themes/theme.dart';
import 'package:odyssey_mobile/design_system/components/timeline_item.dart';

import 'test_host.dart';

void main() {
  testWidgets('shows time, title and subtitle', (tester) async {
    await tester.pumpWidget(themed(const TimelineItem(
      time: '13:25',
      title: 'Szkoła Podst. CENTRUM EDUKACJI TWÓRCZEJ - Kowale',
      subtitle: 'Scena 4 • Problem 5 • Gr. wiekowa J',
    )));

    expect(find.text('13:25'), findsOneWidget);
    expect(find.textContaining('CENTRUM'), findsOneWidget);
    expect(find.textContaining('Scena 4'), findsOneWidget);
  });

  testWidgets('works as first, middle and last entry of a list in both themes', (tester) async {
    for (final brightness in Brightness.values) {
      await tester.pumpWidget(themed(
        const Column(children: [
          TimelineItem(time: '09:30', title: 'A', subtitle: 'a', emphasized: false, isFirst: true),
          TimelineItem(time: '10:45', title: 'B', subtitle: 'b', emphasized: false),
          TimelineItem(time: '13:25', title: 'C', subtitle: 'c', isLast: true),
        ]),
        brightness: brightness,
      ));

      expect(tester.takeException(), isNull);
    }
  });

  testWidgets('title stays readable in dark mode', (tester) async {
    await tester.pumpWidget(themed(
      const TimelineItem(time: '13:25', title: 'Szkoła Podst.', subtitle: 'Scena 4'),
      brightness: Brightness.dark,
    ));

    final title = tester.widget<Text>(find.text('Szkoła Podst.'));
    expect(title.style?.color, themeDark.t.bodyMediumBold?.color);
    expect(title.style?.color, isNot(themeDark.scaffoldBackgroundColor));
  });
}
