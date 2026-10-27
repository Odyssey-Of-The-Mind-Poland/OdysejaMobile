import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:odyssey_mobile/config/ootm_icons.dart';
import 'package:odyssey_mobile/design_system/components/menu_item.dart';
import 'package:odyssey_mobile/design_system/components/toggle.dart';

import 'test_host.dart';

void main() {
  testWidgets('shows a check only when selected', (tester) async {
    await tester.pumpWidget(themed(MenuItem(title: 'Warszawa', onTap: () {})));
    expect(find.byIcon(OotmIcons.check), findsNothing);

    await tester.pumpWidget(themed(MenuItem(title: 'Warszawa', selected: true, onTap: () {})));
    expect(find.byIcon(OotmIcons.check), findsOneWidget);
  });

  testWidgets('embeds a working toggle', (tester) async {
    bool? received;
    await tester.pumpWidget(themed(
      MenuItem(title: 'Tryb ciemny', toggle: false, onToggle: (v) => received = v, onTap: () {}),
    ));

    await tester.tap(find.byType(OotmToggle));
    expect(received, isTrue);
  });

  testWidgets('renders in dark mode without errors', (tester) async {
    await tester.pumpWidget(themed(
      MenuItem(title: 'Kraków', icon: OotmIcons.location, selected: true, onTap: () {}),
      brightness: Brightness.dark,
    ));

    expect(tester.takeException(), isNull);
    expect(find.text('Kraków'), findsOneWidget);
  });
}
