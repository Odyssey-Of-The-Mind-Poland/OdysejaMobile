import 'package:odyssey_mobile/domain/entities/performance.dart';

abstract class PerformanceGroup {
  int get groupId;
  int get problem;
  int get age;
  int get stage;
  int get part;

  /// Performance day
  String get day;
  List<Performance> get performances;

  PerformanceGroup copyWith({
    int? age,
    String? day,
    int? part,
    List<Performance>? performances,
    int? problem,
    int? stage,
  });
}
