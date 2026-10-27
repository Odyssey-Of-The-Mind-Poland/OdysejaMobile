import 'package:flutter_test/flutter_test.dart';
import 'package:odyssey_mobile/config/ootm_icons.dart';
import 'package:odyssey_mobile/design_system/components/info_tooltip.dart';
import 'package:odyssey_mobile/design_system/components/performance_time_block.dart';

import 'test_host.dart';

void main() {
  testWidgets('shows day, time and caption', (tester) async {
    await tester.pumpWidget(themed(const PerformanceTimeBlock(
      day: 'Sb',
      time: '08:15',
      caption: 'Występ',
      hint: 'Drużyna powinna stawić się na **25-20 min** przed występem',
    )));

    expect(find.text('Sb • 08:15'), findsOneWidget);
    expect(find.text('Występ'), findsOneWidget);
    expect(find.byIcon(OotmIcons.info), findsOneWidget);
  });

  testWidgets('tapping the caption reveals the hint without the bold markers', (tester) async {
    await tester.pumpWidget(themed(const PerformanceTimeBlock(
      day: 'Nd',
      time: '14:30',
      caption: 'Spontan',
      hint: 'Drużyna powinna stawić się na **20-15 min** przed spontanem',
    )));

    await tester.tap(find.byType(InfoTooltip));
    await tester.pump(const Duration(milliseconds: 500));

    expect(find.textContaining('20-15 min', findRichText: true), findsOneWidget);
    expect(find.textContaining('**', findRichText: true), findsNothing);
  });
}
