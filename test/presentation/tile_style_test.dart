import 'package:flutter_test/flutter_test.dart';
import 'package:odyssey_mobile/core/data/db/hive/models/problem.dart';
import 'package:odyssey_mobile/core/data/db/hive/models/stage.dart';
import 'package:odyssey_mobile/core/domain/divisions.dart';
import 'package:odyssey_mobile/core/data/db/hive/models/info.dart';
import 'package:odyssey_mobile/design_system/accent.dart';
import 'package:odyssey_mobile/design_system/icons/pattern_glyph.dart';
import 'package:odyssey_mobile/presentation/helpers/tile_style.dart';

InfoHiveModel _info({String? icon, String? color}) => InfoHiveModel(1, 'Info', 'Tekst', 0, icon, color);

void main() {
  group('TileStyles.forInfo', () {
    test('uses the style chosen in the admin panel', () {
      final style = TileStyles.forInfo(_info(icon: 'trophy-01', color: 'purple'), position: 0);

      expect(style.color, AccentColor.purple);
      expect(style.glyph, PatternGlyph.category('trophy-01'));
    });

    test('colours neighbouring tiles differently when the server sent no colour', () {
      final colors = [for (var i = 0; i < 5; i++) TileStyles.forInfo(_info(), position: i).color];

      expect(colors.toSet().length, 5);
    });

    test('the fallback colour wraps around the palette', () {
      expect(
        TileStyles.forInfo(_info(), position: 7).color,
        TileStyles.forInfo(_info(), position: 2).color,
      );
    });

    test('an unknown colour key does not break the tile', () {
      expect(TileStyles.forInfo(_info(color: 'magenta'), position: 3).color, AccentColor.blue);
    });

    test('a missing icon falls back to the default glyph', () {
      expect(TileStyles.forInfo(_info(), position: 0).glyph, PatternGlyph.category(null));
    });
  });

  group('TileStyles.forScheduleCategory', () {
    test('is stable: the same stage always gets the same colour', () {
      final stage = StageHiveModel('Sala C', 3);

      expect(
        TileStyles.forScheduleCategory(stage).color,
        TileStyles.forScheduleCategory(StageHiveModel('Sala C', 3)).color,
      );
    });

    test('stages, problems and age groups use different patterns', () {
      final stage = TileStyles.forScheduleCategory(StageHiveModel('Sala C', 1)).glyph;
      final division = TileStyles.forScheduleCategory(defaultDivisions.first).glyph;

      expect(stage, isNot(division));
    });

    test('consecutive numbers get different colours', () {
      final first = TileStyles.forScheduleCategory(StageHiveModel('A', 1)).color;
      final second = TileStyles.forScheduleCategory(StageHiveModel('B', 2)).color;

      expect(first, isNot(second));
    });
  });

  group('TileStyles.forScheduleCategory', () {
    test('uses the style chosen in the admin panel for stages, problems and age groups', () {
      for (final entity in [
        StageHiveModel('Aula', 1, 'building-02', 'green'),
        ProblemHiveModel('Problem 2', 2, 'building-02', 'green'),
        const FirstDivision(icon: 'building-02', color: 'green'),
      ]) {
        final style = TileStyles.forScheduleCategory(entity);

        expect(style.color, AccentColor.green, reason: '${entity.runtimeType}');
        expect(style.glyph, PatternGlyph.category('building-02'), reason: '${entity.runtimeType}');
      }
    });

    test('without a style the kind keeps its own pattern and the colour follows the number', () {
      final stage = TileStyles.forScheduleCategory(StageHiveModel('Aula', 3));
      final problem = TileStyles.forScheduleCategory(ProblemHiveModel('Problem 3', 3));
      final division = TileStyles.forScheduleCategory(const ThirdDivision());

      expect(stage.color, AccentColor.values[3]);
      expect(problem.color, AccentColor.values[3]);
      expect(division.color, AccentColor.values[3]);
      expect(stage.glyph, PatternGlyph.category('marker-pin-01'));
      expect(problem.glyph, PatternGlyph.category('puzzle-piece-01'));
      expect(division.glyph, PatternGlyph.category('users-01'));
    });

    test('a style with only an icon or only a colour keeps the default for the other half', () {
      final onlyIcon = TileStyles.forScheduleCategory(StageHiveModel('Aula', 4, 'star-01'));
      final onlyColor = TileStyles.forScheduleCategory(StageHiveModel('Aula', 4, null, 'red'));

      expect(onlyIcon.glyph, PatternGlyph.category('star-01'));
      expect(onlyIcon.color, AccentColor.values[4]);
      expect(onlyColor.glyph, PatternGlyph.category('marker-pin-01'));
      expect(onlyColor.color, AccentColor.red);
    });
  });
}
