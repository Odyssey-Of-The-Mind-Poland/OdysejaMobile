import 'package:odyssey_mobile/domain/entities/info.dart';

abstract class InfoCategory {
  List<Info> get info;
  String get name;
  int get number;
}
