import 'package:hive_flutter/hive_flutter.dart';
import 'package:odyssey_mobile/domain/entities/schedule_category_entity.dart';

part 'stage.g.dart';

@HiveType(typeId: 4)
class StageHiveModel extends StageEntity {
  @HiveField(0)
  @override
  final String name;
  @HiveField(1)
  @override
  final int number;

  StageHiveModel(this.name, this.number);
}
