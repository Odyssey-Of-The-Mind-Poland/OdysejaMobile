import 'package:hive_flutter/hive_flutter.dart';

import 'package:odyssey_mobile/domain/entities/performance.dart';

part 'performance.g.dart';

@HiveType(typeId: 6)
class PerformanceHiveModel extends Performance with HiveObjectMixin {
  @HiveField(0)
  @override
  final int performanceId;

  @HiveField(1)
  @override
  final int age;

  @HiveField(10)
  @override
  final String team;

  @HiveField(3)
  @override
  final int part;

  @HiveField(4)
  @override
  final String performance;

  @HiveField(5)
  @override
  final String performanceDay;

  @HiveField(6)
  @override
  final int problem;

  @HiveField(7)
  @override
  final String spontan;

  @HiveField(8)
  @override
  final String spontanDay;

  @HiveField(9)
  @override
  final int stage;

  @HiveField(12)
  @override
  final String league;

  @Deprecated('Not used, not working')
  @override
  int get groupId => -1;

  @HiveField(11)
  @override
  bool isFavourite;

  @override
  @HiveField(13)
  final DateTime performanceDate;

  PerformanceHiveModel({
    required this.performanceId,
    required this.age,
    required this.part,
    required this.performance,
    required this.performanceDay,
    required this.problem,
    required this.spontan,
    required this.spontanDay,
    required this.stage,
    required this.league,
    required this.team,
    required this.isFavourite,
    required this.performanceDate,
  });

  @override
  Future<void> updatePerformance() => save();
}
