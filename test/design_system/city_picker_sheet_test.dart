import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:odyssey_mobile/config/ootm_icons.dart';
import 'package:odyssey_mobile/core/data/db/hive/models/city.dart';
import 'package:odyssey_mobile/l10n/strings.dart';
import 'package:odyssey_mobile/presentation/main_view/city_picker_sheet.dart';
import 'package:odyssey_mobile/widgets/ootm_bottom_sheet.dart';

import 'test_host.dart';

void main() {
  final cities = [CityHiveModel('Warszawa', 1), CityHiveModel('Kraków', 2), CityHiveModel('Gdańsk', 3)];

  testWidgets('lists the cities and marks the selected one', (tester) async {
    await tester.pumpWidget(themed(
      CityPickerSheet(cities: cities, selectedCityId: 2, onSelected: (_) {}),
    ));

    expect(find.text(AppStrings.cityPickerTitle), findsOneWidget);
    for (final city in cities) {
      expect(find.text(city.name), findsOneWidget);
    }
    expect(find.byIcon(OotmIcons.check), findsOneWidget);
  });

  testWidgets('shows a message when there are no cities', (tester) async {
    await tester.pumpWidget(themed(
      CityPickerSheet(cities: const [], selectedCityId: null, onSelected: (_) {}),
    ));

    expect(find.text(AppStrings.cityPickerEmpty), findsOneWidget);
  });

  testWidgets('selecting a city reports its id and closes the sheet', (tester) async {
    int? selected;
    late BuildContext hostContext;
    await tester.pumpWidget(themed(Builder(builder: (context) {
      hostContext = context;
      return const SizedBox();
    })));

    showOotmBottomSheet<void>(
      context: hostContext,
      child: CityPickerSheet(cities: cities, selectedCityId: 1, onSelected: (id) => selected = id),
    );
    await tester.pumpAndSettle();
    await tester.tap(find.text('Gdańsk'));
    await tester.pumpAndSettle();

    expect(selected, 3);
    expect(find.byType(CityPickerSheet), findsNothing);
  });

  testWidgets('renders in dark mode', (tester) async {
    await tester.pumpWidget(themed(
      CityPickerSheet(cities: cities, selectedCityId: 1, onSelected: (_) {}),
      brightness: Brightness.dark,
    ));

    expect(tester.takeException(), isNull);
  });
}
