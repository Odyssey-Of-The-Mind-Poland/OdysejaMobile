import 'package:hive_flutter/hive_flutter.dart';
import 'package:odyssey_mobile/domain/entities/info.dart';

part 'info.g.dart';

@HiveType(typeId: 2)
class InfoHiveModel extends Info {
  @HiveField(0)
  @override
  final int number;

  @HiveField(1)
  @override
  final String infoName;

  @HiveField(2)
  @override
  final String infoText;

  @HiveField(3)
  @override
  final int sortNumber;

  InfoHiveModel(this.number, this.infoName, this.infoText, this.sortNumber);
}
