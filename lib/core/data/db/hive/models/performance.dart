import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:odyssey_mobile/core/domain/performance.dart';

class PerformanceHiveModel extends Performance with HiveObjectMixin {
  @override
  final int performanceId;

  @override
  final int age;

  @override
  final String team;

  @override
  final int part;

  @override
  final String performance;

  @override
  final String performanceDay;

  @override
  final int problem;

  @override
  final String spontan;

  @override
  final String spontanDay;

  @override
  final int stage;

  @override
  final String league;

  @Deprecated('Not used, not working')
  @override
  int get groupId => -1;

  @override
  bool isFavourite;

  @override
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
