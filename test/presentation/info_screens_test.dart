import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:odyssey_mobile/app/themes/theme.dart';
import 'package:odyssey_mobile/core/data/db/hive/models/info_group.dart';
import 'package:odyssey_mobile/config/ootm_icons.dart';
import 'package:odyssey_mobile/design_system/accent.dart';
import 'package:odyssey_mobile/design_system/components/accent_top_bar.dart';
import 'package:odyssey_mobile/design_system/components/info_tile.dart';
import 'package:odyssey_mobile/presentation/info_screen/info_detail_screen.dart';
import 'package:odyssey_mobile/presentation/info_screen/info_grid.dart';
import 'package:odyssey_mobile/presentation/info_screen/info_screen.dart';

import '../helpers/city_data_host.dart';
import '../design_system/test_host.dart';

void main() {
  group('InfoGrid', () {
    testWidgets('shows a tile per info with the style from the server', (tester) async {
      await tester.pumpWidget(themed(
        InfoGrid([
          infoItem(1, 'Dojazd', icon: 'map-01', color: 'green'),
          infoItem(1, 'Noclegi', icon: 'home-02', color: 'red'),
        ]),
        width: 375,
      ));

      expect(find.byType(InfoTile), findsNWidgets(2));
      final tiles = tester.widgetList<InfoTile>(find.byType(InfoTile)).toList();
      expect(tiles.map((t) => t.color), [AccentColor.green, AccentColor.red]);
      expect(find.text('Dojazd'), findsOneWidget);
    });

    testWidgets('tiles without a style still differ from each other', (tester) async {
      await tester.pumpWidget(themed(
        InfoGrid([for (var i = 0; i < 4; i++) infoItem(1, 'Info $i')]),
        width: 375,
      ));

      final colors = tester.widgetList<InfoTile>(find.byType(InfoTile)).map((t) => t.color).toSet();
      expect(colors.length, 4);
    });

    testWidgets('lays tiles out in two columns of 80px height', (tester) async {
      await tester.pumpWidget(themed(
        InfoGrid([for (var i = 0; i < 4; i++) infoItem(1, 'Info $i')]),
        width: 375,
      ));

      final first = tester.getRect(find.byType(InfoTile).at(0));
      final second = tester.getRect(find.byType(InfoTile).at(1));
      expect(first.height, 80);
      expect(second.left, greaterThan(first.right));
      expect(second.top, first.top);
    });

    testWidgets('renders in dark mode', (tester) async {
      await tester.pumpWidget(themed(
        InfoGrid([infoItem(1, 'Dojazd', icon: 'map-01', color: 'blue')]),
        brightness: Brightness.dark,
      ));

      expect(tester.takeException(), isNull);
    });
  });

  group('InfoDetailScreen', () {
    testWidgets('shows the title, the category name and the content', (tester) async {
      final info = infoItem(7, 'Problem Spontaniczny', text: '<p>Gdzie i kiedy?</p>', color: 'purple');
      final bloc = await loadedCityDataBloc(
        cityDataWith(infoGroups: [InfoGroupHiveModel(7, 'Dla drużyn', [info])]),
      );

      await tester.pumpWidget(withCity(bloc, InfoDetailScreen(info: info)));
      await tester.pumpAndSettle();

      expect(find.text('Problem Spontaniczny'), findsOneWidget);
      expect(find.text('Dla drużyn'), findsOneWidget);
      expect(find.textContaining('Gdzie i kiedy?', findRichText: true), findsOneWidget);
    });

    testWidgets('header takes the colour of the info in dark mode too', (tester) async {
      final info = infoItem(7, 'Regulamin', color: 'green');
      final bloc = await loadedCityDataBloc(cityDataWith(infoGroups: [InfoGroupHiveModel(7, 'Dla wszystkich', [info])]));

      await tester.pumpWidget(withCity(bloc, InfoDetailScreen(info: info), brightness: Brightness.dark));
      await tester.pumpAndSettle();

      final header = tester.widget<DecoratedBox>(find
          .descendant(of: find.byType(AccentSliverTopBar), matching: find.byType(DecoratedBox))
          .first);
      expect((header.decoration as BoxDecoration).color, themeDark.accents[AccentColor.green].background);
    });

    testWidgets('works when the category cannot be found', (tester) async {
      final info = infoItem(99, 'Sierota');
      final bloc = await loadedCityDataBloc(cityDataWith());

      await tester.pumpWidget(withCity(bloc, InfoDetailScreen(info: info)));
      await tester.pumpAndSettle();

      expect(find.text('Sierota'), findsWidgets);
      expect(tester.takeException(), isNull);
    });
  });

  group('InfoScreen', () {
    testWidgets('shows the content of the only info right away', (tester) async {
      final info = infoItem(1, 'Regionalny Poznań', text: '<p>Wszystko o regionie</p>');
      final bloc = await loadedCityDataBloc(
        cityDataWith(infoGroups: [InfoGroupHiveModel(1, 'Dla wszystkich', [info])]),
      );

      await tester.pumpWidget(withCity(bloc, const InfoScreen()));
      await tester.pumpAndSettle();

      expect(find.byType(InfoGrid), findsNothing);
      expect(find.byType(InfoFilterBar), findsNothing);
      expect(find.textContaining('Wszystko o regionie', findRichText: true), findsOneWidget);
      expect(find.text('Regionalny Poznań'), findsWidgets);
      // It is the tab itself, so there is nothing to go back to and no category to show.
      expect(find.text('Dla wszystkich'), findsNothing);
      expect(find.byIcon(OotmIcons.arrowLeft), findsNothing);
    });

    testWidgets('keeps the category filter and tiles for a city with many infos', (tester) async {
      final bloc = await loadedCityDataBloc(
        cityDataWith(infoGroups: [
          InfoGroupHiveModel(1, 'Dla wszystkich', [infoItem(1, 'Dojazd'), infoItem(1, 'Noclegi')]),
        ]),
      );

      await tester.pumpWidget(withCity(bloc, const InfoScreen()));
      await tester.pumpAndSettle();

      expect(find.byType(InfoGrid), findsOneWidget);
      expect(find.byType(InfoFilterBar), findsOneWidget);
    });
  });
}
