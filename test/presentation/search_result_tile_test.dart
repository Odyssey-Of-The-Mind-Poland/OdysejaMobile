import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:odyssey_mobile/app/themes/theme.dart';
import 'package:odyssey_mobile/presentation/components/search_result_list_tile.dart';

import '../design_system/test_host.dart';
import '../helpers/schedule_fakes.dart';

List<InlineSpan> _spans(WidgetTester tester) {
  final rich = tester.widget<RichText>(find.descendant(of: find.byType(SearchResultListTile), matching: find.byType(RichText)).first);
  return (rich.text as TextSpan).children!;
}

void main() {
  testWidgets('highlights every occurrence of the phrase in the team name', (tester) async {
    await tester.pumpWidget(themed(SearchResultListTile(
      onTap: () {},
      performance: FakePerformance(1, 'Zespół Szkół FILOMATA - Zespół', '08:15'),
      searchPhrase: 'zes',
    )));

    final highlighted = _spans(tester).whereType<TextSpan>().where((s) => s.style != null).map((s) => s.text).toList();
    expect(highlighted, ['Zes', 'Zes']);
  });

  testWidgets('highlight uses the primary colour of the active theme', (tester) async {
    for (final brightness in Brightness.values) {
      await tester.pumpWidget(themed(
        SearchResultListTile(
          onTap: () {},
          performance: FakePerformance(1, 'Zespół Szkół', '08:15'),
          searchPhrase: 'szk',
        ),
        brightness: brightness,
      ));
      await tester.pumpAndSettle();

      final theme = brightness == Brightness.dark ? themeDark : themeLight;
      final span = _spans(tester).whereType<TextSpan>().firstWhere((s) => s.style != null);
      expect(span.style?.color, theme.extension<OotmCommonTheme>()!.primaryColor);
    }
  });

  testWidgets('an empty phrase shows the plain name and does not loop', (tester) async {
    await tester.pumpWidget(themed(SearchResultListTile(
      onTap: () {},
      performance: FakePerformance(1, 'Zespół Szkół', '08:15'),
      searchPhrase: '',
    )));

    expect(tester.takeException(), isNull);
    expect(find.textContaining('Zespół Szkół', findRichText: true), findsOneWidget);
  });

  testWidgets('tapping the row calls onTap', (tester) async {
    var taps = 0;
    await tester.pumpWidget(themed(SearchResultListTile(
      onTap: () => taps++,
      performance: FakePerformance(1, 'Zespół Szkół', '08:15'),
      searchPhrase: 'zes',
    )));

    await tester.tap(find.byType(SearchResultListTile));
    expect(taps, 1);
  });
}
