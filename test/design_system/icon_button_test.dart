import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:odyssey_mobile/app/themes/theme.dart';
import 'package:odyssey_mobile/config/ootm_icons.dart';
import 'package:odyssey_mobile/design_system/accent.dart';
import 'package:odyssey_mobile/design_system/components/icon_button.dart';

import 'test_host.dart';

void main() {
  testWidgets('is 44px and invokes the callback', (tester) async {
    var taps = 0;
    await tester.pumpWidget(themed(OotmIconButton(icon: OotmIcons.close, onPressed: () => taps++)));

    expect(tester.getSize(find.byType(OotmIconButton)), const Size.square(OotmIconButton.dimension));
    await tester.tap(find.byType(OotmIconButton));
    expect(taps, 1);
  });

  testWidgets('tinted variant follows the accent of the active theme', (tester) async {
    Material material() => tester.widget<Material>(
        find.descendant(of: find.byType(OotmIconButton), matching: find.byType(Material)).first);
    final button = OotmIconButton(icon: OotmIcons.close, color: AccentColor.purple, onPressed: () {});

    await tester.pumpWidget(themed(button));
    expect(material().color, themeLight.accents[AccentColor.purple].background);

    await tester.pumpWidget(themed(button, brightness: Brightness.dark));
    await tester.pumpAndSettle();
    expect(material().color, themeDark.accents[AccentColor.purple].background);
  });
}
