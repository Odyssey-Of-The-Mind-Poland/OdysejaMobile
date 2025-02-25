import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:odyssey_mobile/domain/entities/schedule_category_entity.dart';

part 'problem.g.dart';

@HiveType(typeId: 3)
class ProblemHiveModel extends ProblemEntity {
  @HiveField(0)
  @override
  final String name;
  @HiveField(1)
  @override
  final int number;

  ProblemHiveModel(this.name, this.number);
}
