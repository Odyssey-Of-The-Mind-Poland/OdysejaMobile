import 'package:isar/isar.dart';
import 'package:odyssey_mobile/domain/entities/schedule_category_entity.dart';

part 'problem.g.dart';

@Collection()
class ProblemModelDb extends ProblemEntity {
  int? id;
  @override
  late String name;
  @override
  @Index()
  late int number;
}
