import 'package:hive_ce_flutter/hive_flutter.dart';

import 'package:odyssey_mobile/core/data/db/hive/models/performance.dart';
import 'package:odyssey_mobile/core/domain/performance.dart';
import 'package:odyssey_mobile/core/domain/performance_group.dart';

class PerformanceGroupHiveModel extends PerformanceGroup {
  PerformanceGroupHiveModel({
    required this.groupId,
    required this.problem,
    required this.age,
    required this.stage,
    required this.part,
    required this.league,
    required this.day,
    required this.performancesHiveList,
  }) : _performances = performancesHiveList;

  @override
  final int groupId;

  @override
  final int problem;

  @override
  final int age;

  @override
  final int stage;

  @override
  final int part;

  @override
  final String day;

  late HiveList<PerformanceHiveModel> performancesHiveList;

  @override
  late String league;

  @override
  List<Performance> get performances => _performances;

  /// Variable set to private to be ignored by Hive generator.
  /// Used for list manipulations, for instance in favourites.
  List<Performance> _performances;

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
    ).._performances = performances ?? this.performances;
  }
}
