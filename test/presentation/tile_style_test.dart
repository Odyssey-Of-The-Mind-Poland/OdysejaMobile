import 'package:flutter_test/flutter_test.dart';
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
      final division = TileStyles.forScheduleCategory(divisions.first).glyph;

      expect(stage, isNot(division));
    });

    test('consecutive numbers get different colours', () {
      final first = TileStyles.forScheduleCategory(StageHiveModel('A', 1)).color;
      final second = TileStyles.forScheduleCategory(StageHiveModel('B', 2)).color;

      expect(first, isNot(second));
    });
  });
}
