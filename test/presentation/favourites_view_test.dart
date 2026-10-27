import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:odyssey_mobile/app/themes/theme.dart';
import 'package:odyssey_mobile/core/data/db/hive/models/stage.dart';
import 'package:odyssey_mobile/core/data/load_data_repository.dart';
import 'package:odyssey_mobile/core/domain/performance.dart';
import 'package:odyssey_mobile/core/domain/performance_group.dart';
import 'package:odyssey_mobile/core/failure.dart';
import 'package:odyssey_mobile/design_system/components/filter_item.dart';
import 'package:odyssey_mobile/design_system/components/performance_tile.dart';
import 'package:odyssey_mobile/design_system/components/timeline_item.dart';
import 'package:odyssey_mobile/l10n/strings.dart';
import 'package:odyssey_mobile/presentation/components/favourites_list.dart';
import 'package:odyssey_mobile/presentation/favourites_screen/bloc/favourites_bloc.dart';
import 'package:odyssey_mobile/presentation/favourites_screen/favourites_filter_sheet.dart';
import 'package:odyssey_mobile/presentation/favourites_screen/favourites_view_cubit.dart';
import 'package:odyssey_mobile/presentation/main_view/bloc/city_data_bloc.dart';
import 'package:odyssey_mobile/presentation/main_view/bloc/update_favourites_bloc.dart';

import '../helpers/city_data_host.dart';
import '../helpers/schedule_fakes.dart';

class _Repo implements LoadDataRepository {
  @override
  Future<Either<Failure, Unit>> updateFavourite(Performance performance) async => right(unit);

  @override
  dynamic noSuchMethod(Invocation invocation) => throw UnimplementedError('${invocation.memberName}');
}

PerformanceGroup _group(int id, {required int stage, required int problem, required int age, required List<Performance> performances}) =>
    FakePerformanceGroup(performances, groupId: id).copyWith(stage: stage, problem: problem, age: age);

void main() {
  group('FavouritesView', () {
    final stage1 = _group(1, stage: 1, problem: 1, age: 2, performances: [FakePerformance(1, 'A', '10:00', isFavourite: true)]);
    final stage2 = _group(2, stage: 2, problem: 3, age: 1, performances: [FakePerformance(2, 'B', '08:00', isFavourite: true)]);

    test('an empty selection matches everything', () {
      expect(const FavouritesView().apply([stage1, stage2]), hasLength(2));
      expect(const FavouritesView().hasFilters, isFalse);
    });

    test('filters narrow by stage, problem and age together', () {
      expect(const FavouritesView(stages: {2}).apply([stage1, stage2]), [stage2]);
      expect(const FavouritesView(problems: {1}, ages: {2}).apply([stage1, stage2]), [stage1]);
      expect(const FavouritesView(stages: {1}, ages: {1}).apply([stage1, stage2]), isEmpty);
    });

    test('the timeline is chronological across groups', () {
      final timeline = const FavouritesView().timeline([stage1, stage2]);

      expect(timeline.map((p) => p.team), ['B', 'A']);
    });
  });

  group('FavouritesViewCubit', () {
    test('toggling a value twice removes it again', () {
      final cubit = FavouritesViewCubit();

      cubit.toggleStage(3);
      expect(cubit.state.stages, {3});
      cubit.toggleStage(3);
      expect(cubit.state.stages, isEmpty);
    });

    test('values of different kinds are independent', () {
      final cubit = FavouritesViewCubit()
        ..toggleStage(1)
        ..toggleProblem(2)
        ..toggleAge(3);

      expect(cubit.state.stages, {1});
      expect(cubit.state.problems, {2});
      expect(cubit.state.ages, {3});
      expect(cubit.state.hasFilters, isTrue);
    });

    test('clearing the filters keeps the display mode', () {
      final cubit = FavouritesViewCubit()
        ..setMode(FavouritesDisplayMode.timeline)
        ..toggleStage(1);

      cubit.clearFilters();

      expect(cubit.state.mode, FavouritesDisplayMode.timeline);
      expect(cubit.state.hasFilters, isFalse);
    });
  });

  group('FavouritesFilterSheet', () {
    late FavouritesViewCubit cubit;

    setUp(() => cubit = FavouritesViewCubit());

    Widget sheet({Brightness brightness = Brightness.light}) => BlocProvider.value(
          value: cubit,
          child: MaterialApp(
            theme: themeLight,
            darkTheme: themeDark,
            themeMode: brightness == Brightness.dark ? ThemeMode.dark : ThemeMode.light,
            home: Scaffold(
              body: SingleChildScrollView(
                child: FavouritesFilterSheet(
                  stages: [StageHiveModel('Sala A', 1), StageHiveModel('Sala B', 2)],
                  problems: const [],
                ),
              ),
            ),
          ),
        );

    testWidgets('lists the sections and the stage chips', (tester) async {
      await tester.pumpWidget(sheet());

      expect(find.text(AppStrings.favFilterTitle), findsOneWidget);
      expect(find.text(AppStrings.favFilterDisplayAs), findsOneWidget);
      expect(find.text(AppStrings.favFilterStage), findsOneWidget);
      expect(find.text(AppStrings.favFilterAge), findsOneWidget);
      expect(find.text(AppStrings.favFilterProblem), findsNothing, reason: 'no problems loaded');
      expect(find.widgetWithText(FilterItem, '1'), findsOneWidget);
    });

    testWidgets('tapping a chip toggles the filter and marks it active', (tester) async {
      await tester.pumpWidget(sheet());

      await tester.tap(find.widgetWithText(FilterItem, '2'));
      await tester.pump();

      expect(cubit.state.stages, {2});
      expect(tester.widget<FilterItem>(find.widgetWithText(FilterItem, '2')).active, isTrue);
      expect(tester.widget<FilterItem>(find.widgetWithText(FilterItem, '1')).active, isFalse);
    });

    testWidgets('display mode buttons switch between list and timeline', (tester) async {
      await tester.pumpWidget(sheet());

      await tester.tap(find.text(AppStrings.favFilterTimeline));
      await tester.pump();

      expect(cubit.state.mode, FavouritesDisplayMode.timeline);
    });

    testWidgets('"Wyczyść filtry" resets the selection', (tester) async {
      cubit.toggleStage(1);
      await tester.pumpWidget(sheet());

      await tester.tap(find.text(AppStrings.favFilterClear));
      await tester.pump();

      expect(cubit.state.hasFilters, isFalse);
    });

    testWidgets('renders in dark mode', (tester) async {
      await tester.pumpWidget(sheet(brightness: Brightness.dark));

      expect(tester.takeException(), isNull);
    });
  });

  group('FavouritesList', () {
    late CityDataBloc cityBloc;
    late UpdateFavouritesBloc updateBloc;
    late FavouritesBloc favouritesBloc;
    late FavouritesViewCubit cubit;

    setUp(() async {
      final groups = [
        _group(1, stage: 1, problem: 1, age: 2, performances: [
          FakePerformance(1, 'Zespół Jeden', '10:00', isFavourite: true),
          FakePerformance(2, 'Zespół Dwa', '12:00', isFavourite: true),
        ]),
        _group(2, stage: 2, problem: 3, age: 1, performances: [FakePerformance(3, 'Zespół Trzy', '08:00', isFavourite: true)]),
      ];
      cityBloc = await loadedCityDataBloc(FakeCityData(performanceGroups: groups));
      updateBloc = UpdateFavouritesBloc(_Repo());
      favouritesBloc = FavouritesBloc(cityBloc, updateBloc);
      await favouritesBloc.stream.firstWhere((s) => s is FavouritesSuccess).timeout(
            const Duration(seconds: 2),
            onTimeout: () => favouritesBloc.state,
          );
      cubit = FavouritesViewCubit();
    });

    Widget list() => MultiBlocProvider(
          providers: [
            BlocProvider<CityDataBloc>.value(value: cityBloc),
            BlocProvider<UpdateFavouritesBloc>.value(value: updateBloc),
            BlocProvider<FavouritesBloc>.value(value: favouritesBloc),
            BlocProvider<FavouritesViewCubit>.value(value: cubit),
          ],
          child: MaterialApp(theme: themeLight, home: const Scaffold(body: FavouritesList(secretWidth: 80, day: 'sobota'))),
        );

    testWidgets('list mode shows favourite tiles grouped', (tester) async {
      await tester.pumpWidget(list());
      await tester.pumpAndSettle();

      expect(find.byType(PerformanceTile), findsNWidgets(3));
      expect(find.byType(TimelineItem), findsNothing);
    });

    testWidgets('filters hide the other groups', (tester) async {
      cubit.toggleStage(2);
      await tester.pumpWidget(list());
      await tester.pumpAndSettle();

      expect(find.byType(PerformanceTile), findsOneWidget);
      expect(find.text('Zespół Trzy'), findsOneWidget);
    });

    testWidgets('timeline mode shows one chronological line', (tester) async {
      cubit.setMode(FavouritesDisplayMode.timeline);
      await tester.pumpWidget(list());
      await tester.pumpAndSettle();

      expect(find.byType(TimelineItem), findsNWidgets(3));
      final times = tester.widgetList<TimelineItem>(find.byType(TimelineItem)).map((t) => t.time).toList();
      expect(times, ['08:00', '10:00', '12:00']);
    });

    testWidgets('switching the mode at runtime rebuilds the list', (tester) async {
      await tester.pumpWidget(list());
      await tester.pumpAndSettle();
      expect(find.byType(PerformanceTile), findsWidgets);

      cubit.setMode(FavouritesDisplayMode.timeline);
      await tester.pumpAndSettle();

      expect(find.byType(PerformanceTile), findsNothing);
      expect(find.byType(TimelineItem), findsWidgets);
    });
  });
}
