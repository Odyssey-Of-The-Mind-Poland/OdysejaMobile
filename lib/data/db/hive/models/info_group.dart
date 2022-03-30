import 'package:hive_flutter/hive_flutter.dart';
import 'package:odyssey_mobile/data/db/hive/models/info.dart';
import 'package:odyssey_mobile/domain/entities/info_category.dart';

part 'info_group.g.dart';

@HiveType(typeId: 1)
class InfoGroupHiveModel extends InfoCategory {
  @HiveField(0)
  @override
  final int number;

  @HiveField(1)
  @override
  final String name;

  @HiveField(2)
  @override
  final List<InfoHiveModel> info;

  InfoGroupHiveModel(this.number, this.name, this.info);
}
