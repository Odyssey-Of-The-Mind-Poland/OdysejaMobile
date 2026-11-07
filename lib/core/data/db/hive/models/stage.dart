import 'package:odyssey_mobile/core/domain/schedule_category_entity.dart';

class StageHiveModel extends StageEntity {
  @override
  final String name;
  @override
  final int number;
  @override
  final String? icon;
  @override
  final String? color;

  StageHiveModel(this.name, this.number, [this.icon, this.color]);
}
