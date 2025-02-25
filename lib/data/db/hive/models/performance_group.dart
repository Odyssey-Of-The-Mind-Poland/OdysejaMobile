import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:odyssey_mobile/data/db/hive/models/performance.dart';

import 'package:odyssey_mobile/domain/entities/performance.dart';
import 'package:odyssey_mobile/domain/entities/performance_group.dart';

part 'performance_group.g.dart';

@HiveType(typeId: 5)
class PerformanceGroupHiveModel extends PerformanceGroup {
  @HiveField(0)
  @override
  final int groupId;

  @HiveField(1)
  @override
  final int problem;

  @HiveField(2)
  @override
  final int age;

  @HiveField(3)
  @override
  final int stage;

  @HiveField(4)
  @override
  final int part;

  @HiveField(5)
  @override
  final String day;

  @HiveField(6)
  late HiveList<PerformanceHiveModel> performancesHiveList;

  @HiveField(7)
  @override
  late String league;

  @override
  late List<Performance> performances;
  PerformanceGroupHiveModel({
    required this.groupId,
    required this.problem,
    required this.age,
    required this.stage,
    required this.part,
    required this.league,
    required this.day,
    required this.performancesHiveList,
  }) {
    performances = performancesHiveList;
  }

  @override
  PerformanceGroup copyWith({
    int? groupId,
    int? problem,
    int? age,
    int? stage,
    int? part,
    String? league,
    String? day,
    List<Performance>? performances,
  }) {
    return PerformanceGroupHiveModel(
      groupId: groupId ?? this.groupId,
      problem: problem ?? this.problem,
      age: age ?? this.age,
      stage: stage ?? this.stage,
      part: part ?? this.part,
      league: league ?? this.league,
      day: day ?? this.day,
      performancesHiveList: performancesHiveList,
    )..performances = performances ?? this.performances;
  }
}
