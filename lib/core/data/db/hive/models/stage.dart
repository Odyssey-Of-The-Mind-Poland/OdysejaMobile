import 'package:odyssey_mobile/core/domain/schedule_category_entity.dart';

class StageHiveModel extends StageEntity {
  @override
  final String name;
  @override
  final int number;

  StageHiveModel(this.name, this.number);
}
