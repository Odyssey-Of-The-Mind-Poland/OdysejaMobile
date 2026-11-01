import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:odyssey_mobile/presentation/info_screen/info_content.dart';

import '../design_system/test_host.dart';

const _html = '<h2>Dzień 1</h2>'
    '<p class="accent">Gdynia, al. Zwycięstwa</p>'
    '<table><tbody>'
    '<tr><th><p>Godzina</p></th><th><p>Wydarzenie</p></th></tr>'
    '<tr><td class="accent"><p>06:30 - 18:30</p></td><td><p>Przestrzeń <strong>PPNT</strong> dostępna dla drużyn</p></td></tr>'
    '<tr><td class="accent"><p>07:30</p></td><td><p>Strefy gastronomiczne</p></td></tr>'
    '</tbody></table>'
    '<h3>1. Doceń wolontariuszy</h3>'
    '<p>Cała obsługa pracuje <strong>społecznie</strong>.</p>'
    '<ul><li>Koszulki - 35 zł</li><li>Skarpety - 30 zł</li></ul>';

/// The effective style (all parent spans merged) of the first text run that contains [text].
TextStyle styleOf(WidgetTester tester, String text) {
  TextStyle? found;
  void visit(InlineSpan span, TextStyle inherited) {
    if (found != null) return;
    final style = inherited.merge(span.style);
    if (span is TextSpan) {
      if (span.text?.contains(text) ?? false) {
        found = style;
        return;
      }
      for (final child in span.children ?? const <InlineSpan>[]) {
        visit(child, style);
      }
    }
  }

  for (final richText in tester.widgetList<RichText>(find.byType(RichText))) {
    visit(richText.text, const TextStyle());
    if (found != null) break;
  }
  expect(found, isNotNull, reason: 'no text "$text"');
  return found!;
}

void main() {
  for (final brightness in [Brightness.light, Brightness.dark]) {
    group('InfoContent (${brightness.name})', () {
      testWidgets('draws headings, accent line, list and a table with all its cells', (tester) async {
        await tester.pumpWidget(themed(const SingleChildScrollView(child: InfoContent(html: _html)), brightness: brightness));

        for (final text in ['Dzień 1', 'Gdynia, al. Zwycięstwa', 'Godzina', 'Wydarzenie', '06:30 - 18:30', 'Strefy gastronomiczne', '1. Doceń wolontariuszy', 'Koszulki - 35 zł']) {
          expect(find.textContaining(text, findRichText: true), findsWidgets, reason: text);
        }
        expect(find.byType(Table), findsOneWidget);
        // 3 rows of 2 cells each
        expect(tester.widget<Table>(find.byType(Table)).children.length, 3);
      });

      testWidgets('colours come from the theme: accent for p.accent and td.accent, plain text otherwise', (tester) async {
        await tester.pumpWidget(themed(const SingleChildScrollView(child: InfoContent(html: _html)), brightness: brightness));
        final context = tester.element(find.byType(InfoContent));
        final styles = InfoContentStyles.of(context);

        expect(styleOf(tester, 'Gdynia, al. Zwycięstwa').color, styles.accent);
        expect(styleOf(tester, 'Gdynia, al. Zwycięstwa').fontSize, 16);
        expect(styleOf(tester, 'Dzień 1').fontSize, 20);
        expect(styleOf(tester, 'Dzień 1').color, styles.heading.color);
        expect(styleOf(tester, '06:30 - 18:30').color, styles.accent);
        expect(styleOf(tester, 'Strefy gastronomiczne').color, isNot(styles.accent));
        expect(styleOf(tester, 'Godzina').fontWeight, FontWeight.w500);
        expect(styles.accent, brightness == Brightness.dark ? const Color(0xFFFCC573) : const Color(0xFFE37900));
      });

      testWidgets('ignores colours and fonts pasted into old content', (tester) async {
        const old = '<p><span style="color: rgb(0, 0, 0); font-family: Arial; font-size: 14pt; font-weight: 700">Stary tekst</span></p>';
        await tester.pumpWidget(themed(const InfoContent(html: old), brightness: brightness));
        final context = tester.element(find.byType(InfoContent));
        final styles = InfoContentStyles.of(context);

        final style = styleOf(tester, 'Stary tekst');
        expect(style.color, styles.body.color);
        expect(style.fontFamily, isNot('Arial'));
        expect(style.fontSize, isNot(14 * 4 / 3));
      });
    });
  }

  test('stripInlineStyles removes style and legacy presentation attributes only', () {
    expect(
      stripInlineStyles('<p style="color:red" class="accent"><font color="#fff" face=\'Arial\'>x</font></p>'),
      '<p class="accent"><font>x</font></p>',
    );
  });

  testWidgets('a table with a long first column lets it wrap instead of overflowing', (tester) async {
    const html = '<table><tbody><tr><td><p>Bardzo długi opis w pierwszej kolumnie, który nie mieści się w jednej linii na wąskim ekranie telefonu</p></td><td><p>x</p></td></tr></tbody></table>';
    await tester.pumpWidget(themed(const SingleChildScrollView(child: InfoContent(html: html)), width: 320));

    expect(tester.takeException(), isNull);
  });
}
