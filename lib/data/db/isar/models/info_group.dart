import 'package:isar/isar.dart';
import 'package:odyssey_mobile/data/db/isar/models/info.dart';
import 'package:odyssey_mobile/domain/entities/info.dart';
import 'package:odyssey_mobile/domain/entities/info_category.dart';

part 'info_group.g.dart';

@Collection()
class InfoGroupModelDb extends InfoCategory {
  int? id;
  @override
  late int number;
  @override
  late String name;
  final infoList = IsarLinks<InfoModelDb>();
  @override
  List<Info> get info => infoList.toList()..sort((a, b) => a.number.compareTo(b.number));
}
