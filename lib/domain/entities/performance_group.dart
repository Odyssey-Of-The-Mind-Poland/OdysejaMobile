import 'package:odyssey_mobile/domain/entities/performance.dart';

abstract class PerformanceGroup {
  int get problem;
  int get age;
  int get stage;
  int get part;

  /// Performance day
  String get day;
  List<Performance> get performances;
}
