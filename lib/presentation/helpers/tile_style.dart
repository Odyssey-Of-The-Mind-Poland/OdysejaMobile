import 'package:odyssey_mobile/core/domain/info.dart';
import 'package:odyssey_mobile/core/domain/schedule_category_entity.dart';
import 'package:odyssey_mobile/design_system/accent.dart';
import 'package:odyssey_mobile/design_system/icons/pattern_glyph.dart';

/// Colour and pattern of a coloured tile or header.
class TileStyle {
  const TileStyle({required this.color, required this.glyph});

  final AccentColor color;
  final PatternGlyph glyph;
}

abstract class TileStyles {
  /// Style chosen by the editors; when the server does not send one (older backend, or nothing
  /// selected) the tile gets a colour from its [position] in the list, so neighbours differ.
  static TileStyle forInfo(Info info, {required int position}) => TileStyle(
        color: info.color == null
            ? AccentColor.values[position % AccentColor.values.length]
            : AccentColor.fromKey(info.color),
        glyph: PatternGlyph.category(info.icon),
      );

  /// Style chosen by the editors; stages, problems and age groups that have none keep their own
  /// pattern and a colour that follows the number, so a given stage or problem always looks the same.
  static TileStyle forScheduleCategory(ScheduleCategoryEntity entity) => TileStyle(
        color: entity.color == null
            ? AccentColor.values[entity.number.abs() % AccentColor.values.length]
            : AccentColor.fromKey(entity.color),
        glyph: PatternGlyph.category(entity.icon ??
            switch (entity) {
              StageEntity() => 'marker-pin-01',
              ProblemEntity() => 'puzzle-piece-01',
              DivisionEntity() => 'users-01',
            }),
      );
}
