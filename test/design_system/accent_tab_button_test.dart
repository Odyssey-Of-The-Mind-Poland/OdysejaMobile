import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:odyssey_mobile/app/themes/theme.dart';
import 'package:odyssey_mobile/design_system/accent.dart';
import 'package:odyssey_mobile/design_system/components/accent_tab_button.dart';

import 'test_host.dart';

void main() {
  Material material(WidgetTester tester) => tester.widget<Material>(
      find.descendant(of: find.byType(AccentTabButton), matching: find.byType(Material)).first);

  testWidgets('selected tab is filled with the strong shade, unselected keeps the tint', (tester) async {
    final surface = themeLight.accents[AccentColor.green];

    await tester.pumpWidget(themed(AccentTabButton(
        label: 'Sobota', color: AccentColor.green, selected: true, onPressed: () {})));
    expect(material(tester).color, surface.badgeBackground);

    await tester.pumpWidget(themed(AccentTabButton(
        label: 'Sobota', color: AccentColor.green, selected: false, onPressed: () {})));
    expect(material(tester).color, surface.background);
  });

  testWidgets('invokes the callback and is at least 123x40', (tester) async {
    var taps = 0;
    await tester.pumpWidget(themed(AccentTabButton(
        label: 'Nd', color: AccentColor.green, selected: false, onPressed: () => taps++)));

    await tester.tap(find.text('Nd'));
    expect(taps, 1);
    final size = tester.getSize(find.byType(AccentTabButton));
    expect(size.width, greaterThanOrEqualTo(123));
    expect(size.height, 40);
  });

  testWidgets('follows the dark theme', (tester) async {
    await tester.pumpWidget(themed(
      AccentTabButton(label: 'Sobota', color: AccentColor.green, selected: true, onPressed: () {}),
      brightness: Brightness.dark,
    ));

    expect(material(tester).color, themeDark.accents[AccentColor.green].badgeBackground);
  });
}
