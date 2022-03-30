import 'package:hive_flutter/hive_flutter.dart';
import 'package:odyssey_mobile/domain/entities/performance.dart';
import 'package:odyssey_mobile/domain/entities/performance_group.dart';

part 'performance_group.g.dart';

@HiveType(typeId: 5)
class PerformanceGroupHiveModel extends PerformanceGroup {
  @HiveField(0)
  @override
  // TODO: implement age
  int get age => throw UnimplementedError();

  @HiveField(1)
  @override
  PerformanceGroup copyWith(
      {int? age,
      String? day,
      int? part,
      List<Performance>? performances,
      int? problem,
      int? stage}) {
    // TODO: implement copyWith
    throw UnimplementedError();
  }

  @HiveField(2)
  @override
  // TODO: implement day
  String get day => throw UnimplementedError();

  @HiveField(3)
  @override
  // TODO: implement groupId
  int get groupId => throw UnimplementedError();

  @HiveField(4)
  @override
  // TODO: implement part
  int get part => throw UnimplementedError();

  @HiveField(5)
  @override
  // TODO: implement performances
  List<Performance> get performances => throw UnimplementedError();

  @HiveField(6)
  @override
  // TODO: implement problem
  int get problem => throw UnimplementedError();

  @HiveField(7)
  @override
  // TODO: implement stage
  int get stage => throw UnimplementedError();
}
