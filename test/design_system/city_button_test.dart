import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:odyssey_mobile/app/themes/theme.dart';
import 'package:odyssey_mobile/config/ootm_icons.dart';
import 'package:odyssey_mobile/design_system/components/city_button.dart';

import 'test_host.dart';

void main() {
  testWidgets('shows the city with a location icon and reacts to taps', (tester) async {
    var taps = 0;
    await tester.pumpWidget(themed(CityButton(label: 'Warszawa', onPressed: () => taps++)));

    expect(find.text('Warszawa'), findsOneWidget);
    expect(find.byIcon(OotmIcons.location), findsOneWidget);
    await tester.tap(find.byType(CityButton));
    expect(taps, 1);
  });

  testWidgets('uses the primary button colours of the active theme', (tester) async {
    Material material() => tester.widget<Material>(
        find.descendant(of: find.byType(CityButton), matching: find.byType(Material)).first);

    await tester.pumpWidget(themed(CityButton(label: 'Gdańsk', onPressed: () {})));
    expect(material().color, themeLight.extension<OotmMainButtonTheme>()!.primaryBackground);

    await tester.pumpWidget(themed(CityButton(label: 'Gdańsk', onPressed: () {}), brightness: Brightness.dark));
    await tester.pumpAndSettle();
    expect(material().color, themeDark.extension<OotmMainButtonTheme>()!.primaryBackground);
  });
}
