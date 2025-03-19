import 'package:odyssey_mobile/core/domain/performance.dart';

abstract class PerformanceGroup {
  int get groupId;
  int get problem;
  int get age;
  int get stage;
  int get part;
  String get league;

  /// Performance day
  String get day;
  List<Performance> get performances;

  PerformanceGroup copyWith({
    int? age,
    String? day,
    int? part,
    String? league,
    List<Performance>? performances,
    int? problem,
    int? stage,
  });
}
