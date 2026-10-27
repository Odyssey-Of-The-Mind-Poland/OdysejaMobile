import 'package:odyssey_mobile/core/domain/performance.dart';
import 'package:odyssey_mobile/core/domain/performance_group.dart';

class FakePerformance extends Performance {
  FakePerformance(
    this.performanceId,
    this.team,
    this.performance, {
    this.isFavourite = false,
    this.performanceDay = 'sobota',
    this.spontanDay = 'niedziela',
    this.spontan = '14:30',
  });

  @override
  final int performanceId;
  @override
  final String team;
  @override
  final String performance;
  @override
  bool isFavourite;
  @override
  final String performanceDay;
  @override
  final String spontanDay;
  @override
  final String spontan;

  @override
  int get stage => 3;
  @override
  int get problem => 1;
  @override
  int get age => 1;
  @override
  int get part => 0;
  @override
  String get league => 'A';
  @override
  int get groupId => 0;
  @override
  Future<void> updatePerformance() async {}
  @override
  DateTime get performanceDate => DateTime(2026, 3, 1, int.parse(performance.split(':').first));
}

class FakePerformanceGroup extends PerformanceGroup {
  FakePerformanceGroup(
    this.performances, {
    this.day = 'sobota',
    this.groupId = 0,
    this.stage = 3,
    this.problem = 1,
    this.age = 1,
    this.part = 0,
    this.league = 'A',
    this.guest = false,
  });

  @override
  final List<Performance> performances;
  @override
  final String day;
  @override
  final int groupId;
  @override
  final int stage;
  @override
  final int problem;
  @override
  final int age;
  @override
  final int part;
  @override
  final String league;
  @override
  final bool guest;

  @override
  PerformanceGroup copyWith({
    int? age,
    String? day,
    int? part,
    String? league,
    bool? guest,
    List<Performance>? performances,
    int? problem,
    int? stage,
  }) =>
      FakePerformanceGroup(
        performances ?? this.performances,
        day: day ?? this.day,
        groupId: groupId,
        stage: stage ?? this.stage,
        problem: problem ?? this.problem,
        age: age ?? this.age,
        part: part ?? this.part,
        league: league ?? this.league,
        guest: guest ?? this.guest,
      );
}
