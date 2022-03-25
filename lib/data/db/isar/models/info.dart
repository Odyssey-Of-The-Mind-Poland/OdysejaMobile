import 'package:isar/isar.dart';
import 'package:odyssey_mobile/domain/entities/info.dart';

part 'info.g.dart';

@Collection()
class InfoModelDb extends Info {
  int? id;
  @override
  late int number;
  @override
  late String infoName;
  @override
  late String infoText;
  @Index(composite: [CompositeIndex('number')])
  late int city;
}
