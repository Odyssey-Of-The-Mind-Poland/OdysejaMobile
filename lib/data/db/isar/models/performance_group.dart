import 'package:isar/isar.dart';

import 'package:odyssey_mobile/data/db/isar/models/performance.dart';
import 'package:odyssey_mobile/domain/entities/performance.dart';
import 'package:odyssey_mobile/domain/entities/performance_group.dart';

part 'performance_group.g.dart';

@Collection(inheritance: false)
class PerformanceGroupModelDb extends PerformanceGroup {
  Id? id;
  @override
  late int groupId;
  @Index(composite: [CompositeIndex('problem'), CompositeIndex('age')])
  @override
  late int stage;
  @override
  late int problem;
  @override
  late int age;
  @override
  late int part;
  @override
  late String day;

  final performancesIsarLinks = IsarLinks<PerformanceModelDb>();

  @override
  @ignore
  late List<Performance> performances;

  void sortAndInit() {
    performances = performancesIsarLinks.toList()
      ..sort((a, b) => a.performanceId.compareTo(b.performanceId));
  }

  @override
  PerformanceGroupModelDb copyWith({
    int? id,
    int? groupId,
    int? stage,
    int? problem,
    int? age,
    int? part,
    String? day,
    List<Performance>? performances,
  }) =>
      PerformanceGroupModelDb()
        ..id = id ?? this.id
        ..groupId = groupId ?? this.groupId
        ..stage = stage ?? this.stage
        ..problem = problem ?? this.problem
        ..age = age ?? this.age
        ..part = part ?? this.part
        ..day = day ?? this.day
        ..performances = performances ?? this.performances;
}
