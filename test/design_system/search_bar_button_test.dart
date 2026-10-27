import 'package:flutter_test/flutter_test.dart';
import 'package:odyssey_mobile/design_system/components/search_bar_button.dart';

import 'test_host.dart';

void main() {
  testWidgets('shows the hint and opens on tap', (tester) async {
    var taps = 0;
    await tester.pumpWidget(themed(
      SearchBarButton(hint: 'Wyszukaj drużynę, problem, scenę i inne...', onTap: () => taps++),
      width: 343,
    ));

    expect(find.text('Wyszukaj drużynę, problem, scenę i inne...'), findsOneWidget);
    await tester.tap(find.byType(SearchBarButton));
    expect(taps, 1);
    expect(tester.getSize(find.byType(SearchBarButton)).height, 56);
  });

  testWidgets('truncates a long hint on a narrow screen', (tester) async {
    await tester.pumpWidget(themed(
      SearchBarButton(hint: 'Wyszukaj drużynę, problem, scenę i inne rzeczy które nas interesują', onTap: () {}),
      width: 220,
    ));

    expect(tester.takeException(), isNull);
  });
}
