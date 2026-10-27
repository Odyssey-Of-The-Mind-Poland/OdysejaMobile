import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:odyssey_mobile/app/themes/theme.dart';
import 'package:odyssey_mobile/design_system/components/filter_item.dart';

import 'test_host.dart';

void main() {
  testWidgets('uses selected tokens only when active', (tester) async {
    Material material() => tester.widget<Material>(
        find.descendant(of: find.byType(FilterItem), matching: find.byType(Material)).first);
    final buttons = themeLight.extension<OotmMainButtonTheme>()!;

    await tester.pumpWidget(themed(FilterItem(label: '2', active: false, onPressed: () {})));
    expect(material().color, buttons.tertiaryBackground);

    await tester.pumpWidget(themed(FilterItem(label: '2', active: true, onPressed: () {})));
    expect(material().color, buttons.tertiaryBackgroundSelected);
  });

  testWidgets('invokes the callback', (tester) async {
    var taps = 0;
    await tester.pumpWidget(themed(FilterItem(label: '4', active: false, onPressed: () => taps++)));

    await tester.tap(find.text('4'));
    expect(taps, 1);
  });
}
