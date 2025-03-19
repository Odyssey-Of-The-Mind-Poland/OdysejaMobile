import 'package:odyssey_mobile/domain/entities/schedule_category_entity.dart';

class ProblemHiveModel extends ProblemEntity {
  @override
  final String name;
  @override
  final int number;

  ProblemHiveModel(this.name, this.number);
}
