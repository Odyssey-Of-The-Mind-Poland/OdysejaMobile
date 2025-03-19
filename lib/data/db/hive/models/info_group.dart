import 'package:odyssey_mobile/data/db/hive/models/info.dart';
import 'package:odyssey_mobile/domain/entities/info_category.dart';

class InfoGroupHiveModel extends InfoCategory {
  @override
  final int number;

  @override
  final String name;

  @override
  final List<InfoHiveModel> info;

  InfoGroupHiveModel(this.number, this.name, this.info);
}
