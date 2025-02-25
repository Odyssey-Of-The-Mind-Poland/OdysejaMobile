import 'package:hive_ce_flutter/hive_flutter.dart';

part 'sponsor.g.dart';

@HiveType(typeId: 7)
class SponsorHiveModel {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final int row;
  @HiveField(2)
  final int column;

  SponsorHiveModel(this.id, this.row, this.column);
}
