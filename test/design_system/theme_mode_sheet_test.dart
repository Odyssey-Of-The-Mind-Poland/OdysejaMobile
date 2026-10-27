import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:odyssey_mobile/app/themes/theme_mode_cubit.dart';
import 'package:odyssey_mobile/config/ootm_icons.dart';
import 'package:odyssey_mobile/l10n/strings.dart';
import 'package:odyssey_mobile/presentation/main_view/theme_mode_sheet.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'test_host.dart';

void main() {
  late ThemeModeCubit cubit;

  setUp(() async {
    SharedPreferences.setMockInitialValues({});
    cubit = ThemeModeCubit(await SharedPreferences.getInstance());
  });

  Widget sheet() => BlocProvider.value(value: cubit, child: themed(const ThemeModeSheet()));

  testWidgets('lists the three modes and marks the current one', (tester) async {
    await tester.pumpWidget(sheet());

    expect(find.text(AppStrings.themeModeTitle), findsOneWidget);
    expect(find.text(AppStrings.themeModeLight), findsOneWidget);
    expect(find.text(AppStrings.themeModeDark), findsOneWidget);
    expect(find.text(AppStrings.themeModeSystem), findsOneWidget);
    expect(find.byIcon(OotmIcons.check), findsOneWidget);
  });

  testWidgets('choosing a mode updates and persists the cubit', (tester) async {
    await tester.pumpWidget(sheet());

    await tester.tap(find.text(AppStrings.themeModeDark));
    await tester.pump();

    expect(cubit.state, ThemeMode.dark);
    expect((await SharedPreferences.getInstance()).getString(ThemeModeCubit.storageKey), 'dark');
  });

  testWidgets('the check mark follows the selection', (tester) async {
    await tester.pumpWidget(sheet());

    await tester.tap(find.text(AppStrings.themeModeSystem));
    await tester.pump();

    final checked = find.ancestor(of: find.byIcon(OotmIcons.check), matching: find.byType(Row)).first;
    expect(find.descendant(of: checked, matching: find.text(AppStrings.themeModeSystem)), findsOneWidget);
  });
}
