import 'package:isar/isar.dart';
import 'package:odyssey_mobile/data/db/isar/models/performance.dart';
import 'package:odyssey_mobile/domain/entities/performance.dart';
import 'package:odyssey_mobile/domain/entities/performance_group.dart';

part 'performance_group.g.dart';

@Collection()
class PerformanceGroupModelDb extends PerformanceGroup {
  int? id;
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
  late List<Performance> performances;

  void sortAndInit() {
    performances = performancesIsarLinks.toList()..sort((a, b) => a.performanceId.compareTo(b.performanceId));
  }
}
