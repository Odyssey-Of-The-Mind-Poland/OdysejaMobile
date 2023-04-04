import 'package:isar/isar.dart';
import 'package:odyssey_mobile/domain/entities/info.dart';

part 'info.g.dart';

@embedded
class InfoModelDb extends Info {
  @override
  late int number;
  @override
  late String infoName;
  @override
  late String infoText;
  late int city;
  @override
  late int sortNumber;
}
