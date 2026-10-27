import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:odyssey_mobile/app/themes/theme.dart';
import 'package:odyssey_mobile/core/data/db/hive/models/stage.dart';
import 'package:odyssey_mobile/core/data/load_data_repository.dart';
import 'package:odyssey_mobile/core/domain/performance.dart';
import 'package:odyssey_mobile/core/failure.dart';
import 'package:odyssey_mobile/design_system/accent.dart';
import 'package:odyssey_mobile/design_system/components/accent_tab_button.dart';
import 'package:odyssey_mobile/design_system/components/accent_top_bar.dart';
import 'package:odyssey_mobile/design_system/components/performance_tile.dart';
import 'package:odyssey_mobile/design_system/components/schedule_tile.dart';
import 'package:odyssey_mobile/presentation/components/performance_category_list.dart';
import 'package:odyssey_mobile/presentation/components/schedule_layout.dart';
import 'package:odyssey_mobile/presentation/main_view/bloc/update_favourites_bloc.dart';

import '../helpers/schedule_fakes.dart';

class _Repo implements LoadDataRepository {
  @override
  Future<Either<Failure, Unit>> updateFavourite(Performance performance) async => right(unit);

  @override
  dynamic noSuchMethod(Invocation invocation) => throw UnimplementedError('${invocation.memberName}');
}

Widget _app(Widget child, {Brightness brightness = Brightness.light}) => BlocProvider(
      create: (_) => UpdateFavouritesBloc(_Repo()),
      child: MaterialApp(
        theme: themeLight,
        darkTheme: themeDark,
        themeMode: brightness == Brightness.dark ? ThemeMode.dark : ThemeMode.light,
        home: child,
      ),
    );

ScheduleLayout _layout(List<String> days, StageHiveModel stage, {bool dark = false}) {
  final groups = [
    for (final day in days)
      FakePerformanceGroup(
        [
          FakePerformance(1, 'Zespół Szkół Nr 4 - Poznań', '08:00', performanceDay: day),
          FakePerformance(2, 'Zespół Szkół FILOMATA - Gliwice', '08:15', isFavourite: true, performanceDay: day),
          FakePerformance(3, 'Zespół Szkół STO - Łódź', '09:45', performanceDay: day),
        ],
        day: day,
      ),
  ];
  return ScheduleLayout(days: days, performanceGroups: groups, title: stage.title, categoryEntity: stage);
}

void main() {
  final stage = StageHiveModel('Sala Piaskowa', 3);

  group('PerformanceCategoryList', () {
    testWidgets('shows a coloured tile with a number badge per category', (tester) async {
      await tester.pumpWidget(MaterialApp(
        theme: themeLight,
        home: Scaffold(
          body: PerformanceCategoryList(parameters: [StageHiveModel('Sala C', 1), StageHiveModel('Sala B', 2)]),
        ),
      ));

      expect(find.byType(ScheduleTile), findsNWidgets(2));
      expect(find.text('1'), findsOneWidget);
      expect(find.text('Sala C'), findsOneWidget);
      final colors = tester.widgetList<ScheduleTile>(find.byType(ScheduleTile)).map((t) => t.color).toSet();
      expect(colors.length, 2);
    });
  });

  group('ScheduleLayout (detail of a stage)', () {
    testWidgets('shows the tinted header with title, subtitle and the performances as tiles', (tester) async {
      await tester.pumpWidget(_app(_layout(['sobota'], stage)));
      await tester.pumpAndSettle();

      expect(find.byType(AccentSliverTopBar), findsOneWidget);
      expect(find.text(stage.title), findsWidgets);
      expect(find.text('Sala Piaskowa'), findsWidgets);
      expect(find.byType(PerformanceTile), findsNWidgets(3));
      expect(find.byType(AccentTabButton), findsNothing);
    });

    testWidgets('marks favourites with the favourite state', (tester) async {
      await tester.pumpWidget(_app(_layout(['sobota'], stage)));
      await tester.pumpAndSettle();

      final states = tester.widgetList<PerformanceTile>(find.byType(PerformanceTile)).map((t) => t.state).toList();
      expect(states, [
        PerformanceTileState.normal,
        PerformanceTileState.favourite,
        PerformanceTileState.normal,
      ]);
    });

    testWidgets('multiple days become tabs in the header and switch the list', (tester) async {
      await tester.pumpWidget(_app(_layout(['sobota', 'niedziela'], stage)));
      await tester.pumpAndSettle();

      expect(find.byType(AccentTabButton), findsNWidgets(2));
      var tabs = tester.widgetList<AccentTabButton>(find.byType(AccentTabButton)).toList();
      expect(tabs.map((t) => t.selected), [true, false]);

      await tester.tap(find.text('Niedziela'));
      await tester.pumpAndSettle();

      tabs = tester.widgetList<AccentTabButton>(find.byType(AccentTabButton)).toList();
      expect(tabs.map((t) => t.selected), [false, true]);
    });

    testWidgets('tabs use the colour of the category', (tester) async {
      await tester.pumpWidget(_app(_layout(['sobota', 'niedziela'], stage)));
      await tester.pumpAndSettle();

      final expected = AccentColor.values[stage.number % AccentColor.values.length];
      final tab = tester.widget<AccentTabButton>(find.byType(AccentTabButton).first);
      expect(tab.color, expected);
    });

    testWidgets('renders in dark mode', (tester) async {
      await tester.pumpWidget(_app(_layout(['sobota', 'niedziela'], stage), brightness: Brightness.dark));
      await tester.pumpAndSettle();

      expect(tester.takeException(), isNull);
      expect(find.byType(PerformanceTile), findsWidgets);
    });
  });
}
