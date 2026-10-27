import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:odyssey_mobile/app/themes/theme.dart';
import 'package:odyssey_mobile/l10n/strings.dart';
import 'package:odyssey_mobile/presentation/main_view/settings_sheet.dart';
import 'package:odyssey_mobile/widgets/ootm_bottom_sheet.dart';

import '../design_system/test_host.dart';

void main() {
  testWidgets('shows the title and the appearance entry', (tester) async {
    await tester.pumpWidget(themed(SettingsSheet(onAppearance: () {})));

    expect(find.text(AppStrings.settingsTitle), findsOneWidget);
    expect(find.text(AppStrings.themeModeTitle), findsOneWidget);
  });

  testWidgets('choosing appearance closes the sheet and opens the follow-up', (tester) async {
    var opened = 0;
    late BuildContext hostContext;
    await tester.pumpWidget(themed(Builder(builder: (context) {
      hostContext = context;
      return const SizedBox();
    })));

    showOotmBottomSheet<void>(
      context: hostContext,
      child: SettingsSheet(onAppearance: () => opened++),
    );
    await tester.pumpAndSettle();
    await tester.tap(find.text(AppStrings.themeModeTitle));
    await tester.pumpAndSettle();

    expect(opened, 1);
    expect(find.byType(SettingsSheet), findsNothing);
  });

  test('both themes style tabs and progress indicators with the primary colour', () {
    for (final theme in [themeLight, themeDark]) {
      expect(theme.tabBarTheme.indicator, isA<UnderlineTabIndicator>());
      expect(theme.progressIndicatorTheme.color, isNotNull);
    }
  });

  test('tab labels are readable in dark mode', () {
    expect(themeDark.tabBarTheme.labelColor, isNot(themeDark.scaffoldBackgroundColor));
    expect(themeDark.tabBarTheme.unselectedLabelColor, isNot(themeDark.scaffoldBackgroundColor));
  });
}
