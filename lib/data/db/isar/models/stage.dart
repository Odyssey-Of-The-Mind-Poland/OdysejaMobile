import 'package:isar/isar.dart';
import 'package:odyssey_mobile/domain/entities/schedule_category_entity.dart';

part 'stage.g.dart';

@Collection()
class StageModelDb extends StageEntity {
  Id? id;
  @override
  @Index()
  late int number;
  @override
  late String name;
}
