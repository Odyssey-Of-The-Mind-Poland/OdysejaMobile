import 'package:flutter_test/flutter_test.dart';
import 'package:odyssey_mobile/config/ootm_icons.dart';
import 'package:odyssey_mobile/design_system/components/search_bar_button.dart';
import 'package:odyssey_mobile/l10n/strings.dart';
import 'package:odyssey_mobile/presentation/schedule_screen/schedule_screen.dart';

import '../helpers/city_data_host.dart';

void main() {
  group('ScheduleScreen search', () {
    testWidgets('shows only the magnifier until it is tapped', (tester) async {
      final bloc = await loadedCityDataBloc(FakeCityData());
      await tester.pumpWidget(withCity(bloc, const ScheduleScreen()));
      await tester.pumpAndSettle();

      expect(find.byType(SearchBarButton), findsNothing);
      expect(find.byIcon(OotmIcons.search), findsOneWidget);

      await tester.tap(find.byIcon(OotmIcons.search));
      await tester.pumpAndSettle();

      expect(find.byType(SearchBarButton), findsOneWidget);
      // The field replaces the magnifier.
      expect(find.byIcon(OotmIcons.search), findsOneWidget);
      expect(find.descendant(of: find.byType(SearchBarButton), matching: find.byIcon(OotmIcons.search)), findsOneWidget);
    });

    testWidgets('hides the stage section for a city without stages', (tester) async {
      final bloc = await loadedCityDataBloc(FakeCityData());
      await tester.pumpWidget(withCity(bloc, const ScheduleScreen()));
      await tester.pumpAndSettle();

      expect(find.text(AppStrings.scheduleScreenStageHeading), findsNothing);
      expect(find.text(AppStrings.scheduleScreenProblemHeading), findsOneWidget);
    });
  });
}
