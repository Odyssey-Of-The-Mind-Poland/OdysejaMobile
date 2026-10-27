import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:odyssey_mobile/app/themes/theme.dart';
import 'package:odyssey_mobile/config/ootm_icons.dart';
import 'package:odyssey_mobile/design_system/design_system.dart';

import 'test_host.dart';

void main() {
  Material tileMaterial(WidgetTester tester) =>
      tester.widget<Material>(find.descendant(of: find.byType(InfoTile), matching: find.byType(Material)).first);

  testWidgets('renders the title and reacts to taps', (tester) async {
    var taps = 0;
    await tester.pumpWidget(themed(
      InfoTile(title: 'Zakwaterowanie', icon: OotmIcons.map, color: AccentColor.blue, onTap: () => taps++),
    ));

    expect(find.text('Zakwaterowanie'), findsOneWidget);
    await tester.tap(find.byType(InfoTile));
    expect(taps, 1);
  });

  testWidgets('takes its surface colour from the light theme', (tester) async {
    await tester.pumpWidget(themed(
      const InfoTile(title: 'Info', icon: OotmIcons.map, color: AccentColor.green),
    ));

    expect(tileMaterial(tester).color, themeLight.accents[AccentColor.green].background);
  });

  testWidgets('switches the surface colour in dark mode', (tester) async {
    await tester.pumpWidget(themed(
      const InfoTile(title: 'Info', icon: OotmIcons.map, color: AccentColor.green),
      brightness: Brightness.dark,
    ));

    expect(tileMaterial(tester).color, themeDark.accents[AccentColor.green].background);
    final title = tester.widget<Text>(find.text('Info'));
    expect(title.style?.color, themeDark.accents[AccentColor.green].foreground);
  });

  testWidgets('long titles are truncated instead of overflowing', (tester) async {
    await tester.pumpWidget(themed(
      const SizedBox(
        width: 164,
        child: InfoTile(
          title: 'Bardzo długa nazwa kategorii informacji, która nie mieści się w kafelku',
          icon: OotmIcons.map,
          color: AccentColor.red,
        ),
      ),
    ));

    expect(tester.takeException(), isNull);
  });
}
