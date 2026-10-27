import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:odyssey_mobile/design_system/components/toggle.dart';

import 'test_host.dart';

void main() {
  testWidgets('flips the value on tap', (tester) async {
    bool? received;
    await tester.pumpWidget(themed(OotmToggle(value: false, onChanged: (v) => received = v)));

    await tester.tap(find.byType(OotmToggle));
    expect(received, isTrue);
  });

  testWidgets('does nothing when disabled', (tester) async {
    await tester.pumpWidget(themed(const OotmToggle(value: true, onChanged: null)));

    await tester.tap(find.byType(OotmToggle));
    expect(tester.takeException(), isNull);
  });

  testWidgets('has the 56x32 size from the design', (tester) async {
    await tester.pumpWidget(themed(OotmToggle(value: true, onChanged: (_) {})));

    expect(tester.getSize(find.byType(OotmToggle)), const Size(56, 32));
  });
}
