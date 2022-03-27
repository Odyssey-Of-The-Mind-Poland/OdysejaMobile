import 'package:isar/isar.dart';
import 'package:odyssey_mobile/data/db/isar/models/performance_group.dart';
import 'package:odyssey_mobile/domain/entities/performance.dart';

part 'performance.g.dart';

@Collection()
class PerformanceModelDb extends Performance {
  int? id;
  @override
  late int performanceId;
  @Index()
  late int city;
  @override
  late String team;
  @override
  late int stage;
  @override
  late int problem;
  @override
  late int age;
  @override
  late String performance;
  @override
  late String spontan;
  @override
  late String performanceDay;
  @override
  late String spontanDay;
  @override
  late int part;
  @override
  @Index()
  late bool isFavourite;

  @Backlink(to: 'performancesIsarLinks')
  final group = IsarLink<PerformanceGroupModelDb>();

  @override
  int get groupId => group.value?.groupId ?? -1;
}
