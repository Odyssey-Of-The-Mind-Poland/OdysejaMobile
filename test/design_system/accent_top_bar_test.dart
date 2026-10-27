import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:odyssey_mobile/app/themes/theme.dart';
import 'package:odyssey_mobile/config/ootm_icons.dart';
import 'package:odyssey_mobile/design_system/accent.dart';
import 'package:odyssey_mobile/design_system/components/accent_top_bar.dart';

import 'test_host.dart';

Widget _screen({
  VoidCallback? onBack,
  Brightness brightness = Brightness.light,
  Widget? bottom,
}) =>
    themed(
      CustomScrollView(slivers: [
        AccentSliverTopBar(
          title: 'Scena 3',
          subtitle: 'Sala Piaskowa',
          icon: OotmIcons.map,
          color: AccentColor.purple,
          bottom: bottom,
          onBack: onBack,
        ),
        SliverList.builder(itemCount: 40, itemBuilder: (_, i) => SizedBox(height: 60, child: Text('Wiersz $i'))),
      ]),
      brightness: brightness,
    );

final _bar = find.descendant(of: find.byType(AccentSliverTopBar), matching: find.byType(DecoratedBox)).first;

void main() {
  testWidgets('expanded bar shows title and subtitle separately', (tester) async {
    await tester.pumpWidget(_screen());

    expect(find.text('Scena 3'), findsOneWidget);
    expect(find.text('Sala Piaskowa'), findsOneWidget);
  });

  testWidgets('collapsed bar shows a single combined line', (tester) async {
    await tester.pumpWidget(_screen());
    await tester.pump();
    final expandedHeight = tester.getSize(_bar).height;

    await tester.drag(find.byType(CustomScrollView), const Offset(0, -400));
    await tester.pumpAndSettle();

    final combined = tester.widget<Opacity>(
      find.ancestor(of: find.text('Scena 3 • Sala Piaskowa'), matching: find.byType(Opacity)).first,
    );
    expect(combined.opacity, 1.0);
    expect(tester.getSize(_bar).height, lessThan(expandedHeight));
  });

  testWidgets('back button calls onBack', (tester) async {
    var backs = 0;
    await tester.pumpWidget(_screen(onBack: () => backs++));

    await tester.tap(find.byIcon(OotmIcons.arrowLeft));
    expect(backs, 1);
  });

  testWidgets('uses the dark accent surface in dark mode', (tester) async {
    await tester.pumpWidget(_screen(brightness: Brightness.dark));

    final decoration = tester.widget<DecoratedBox>(find
        .descendant(of: find.byType(AccentSliverTopBar), matching: find.byType(DecoratedBox))
        .first);
    expect((decoration.decoration as BoxDecoration).color, themeDark.accents[AccentColor.purple].background);
  });

  testWidgets('bottom row stays visible when the bar collapses', (tester) async {
    await tester.pumpWidget(_screen(bottom: const SizedBox(height: 40, child: Text('Sobota'))));
    expect(find.text('Sobota'), findsOneWidget);

    await tester.drag(find.byType(CustomScrollView), const Offset(0, -400));
    await tester.pumpAndSettle();

    final opacity = tester.widget<Opacity>(
      find.ancestor(of: find.text('Scena 3 • Sala Piaskowa'), matching: find.byType(Opacity)).first,
    );
    expect(opacity.opacity, 1.0);
    expect(find.text('Sobota').hitTestable(), findsOneWidget);
  });

  testWidgets('heights match the design (172 collapsed / 236 expanded with tabs)', (tester) async {
    tester.view.padding = FakeViewPadding(top: 44 * tester.view.devicePixelRatio);
    addTearDown(tester.view.resetPadding);
    await tester.pumpWidget(_screen(bottom: const SizedBox(height: 40)));
    expect(tester.getSize(_bar).height, 236);

    await tester.drag(find.byType(CustomScrollView), const Offset(0, -400));
    await tester.pumpAndSettle();
    expect(tester.getSize(_bar).height, 172);
  });
}
