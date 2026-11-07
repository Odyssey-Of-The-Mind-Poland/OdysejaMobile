import 'package:odyssey_mobile/core/domain/schedule_category_entity.dart';

class ProblemHiveModel extends ProblemEntity {
  @override
  final String name;
  @override
  final int number;
  @override
  final String? icon;
  @override
  final String? color;

  ProblemHiveModel(this.name, this.number, [this.icon, this.color]);
}
