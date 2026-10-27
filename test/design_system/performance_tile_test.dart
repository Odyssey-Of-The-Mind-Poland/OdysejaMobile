import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:odyssey_mobile/app/themes/theme.dart';
import 'package:odyssey_mobile/design_system/accent.dart';
import 'package:odyssey_mobile/design_system/components/performance_tile.dart';

import 'test_host.dart';

void main() {
  Material material(WidgetTester tester) => tester.widget<Material>(
      find.descendant(of: find.byType(PerformanceTile), matching: find.byType(Material)).first);

  testWidgets('shows time and title and reacts to taps', (tester) async {
    var taps = 0;
    await tester.pumpWidget(themed(
      PerformanceTile(time: '08:15', title: 'Zespół Szkół FILOMATA - Gliwice', onTap: () => taps++),
    ));

    expect(find.text('08:15'), findsOneWidget);
    expect(find.text('Zespół Szkół FILOMATA - Gliwice'), findsOneWidget);
    await tester.tap(find.byType(PerformanceTile));
    expect(taps, 1);
  });

  testWidgets('favourite tile gets the orange tint, normal tile the surface colour', (tester) async {
    final common = themeLight.extension<OotmCommonTheme>()!;

    await tester.pumpWidget(themed(const PerformanceTile(time: '08:00', title: 'A')));
    expect(material(tester).color, common.surfaceColor);

    await tester.pumpWidget(themed(
      const PerformanceTile(time: '08:00', title: 'A', state: PerformanceTileState.favourite),
    ));
    expect(material(tester).color, themeLight.accents[AccentColor.orange].background);
  });

  testWidgets('highlighted tile has a primary border', (tester) async {
    await tester.pumpWidget(themed(
      const PerformanceTile(time: '09:45', title: 'A', state: PerformanceTileState.highlighted),
    ));

    final shape = material(tester).shape as RoundedRectangleBorder;
    expect(shape.side.color, themeLight.extension<OotmCommonTheme>()!.primaryColor);
  });

  testWidgets('long team names do not overflow on a narrow screen', (tester) async {
    await tester.pumpWidget(themed(
      const PerformanceTile(
        time: '10:00',
        title: 'Szkoła Podstawowa CENTRUM EDUKACJI TWÓRCZEJ - Kowale koło Gdańska i okolic',
      ),
      width: 320,
    ));

    expect(tester.takeException(), isNull);
  });

  testWidgets('renders in dark mode', (tester) async {
    await tester.pumpWidget(themed(
      const PerformanceTile(time: '08:00', title: 'A', state: PerformanceTileState.favourite),
      brightness: Brightness.dark,
    ));

    expect(tester.takeException(), isNull);
  });
}
