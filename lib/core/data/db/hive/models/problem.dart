import 'package:odyssey_mobile/core/domain/schedule_category_entity.dart';

class ProblemHiveModel extends ProblemEntity {
  @override
  final String name;
  @override
  final int number;

  ProblemHiveModel(this.name, this.number);
}
