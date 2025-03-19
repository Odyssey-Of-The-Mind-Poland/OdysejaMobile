import 'package:odyssey_mobile/core/domain/info.dart';

abstract class InfoCategory {
  List<Info> get info;
  String get name;
  int get number;
}
