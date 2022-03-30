import 'package:hive_flutter/hive_flutter.dart';
import 'package:odyssey_mobile/domain/entities/performance.dart';

part 'performance.g.dart';

@HiveType(typeId: 6)
class PerformanceHiveModel extends Performance {
  @HiveField(0)
  @override
  // TODO: implement performanceId
  int get performanceId => throw UnimplementedError();
  @HiveField(1)
  @override
  // TODO: implement age
  int get age => throw UnimplementedError();

  @HiveField(2)
  @override
  // TODO: implement groupId
  int get groupId => throw UnimplementedError();

  @HiveField(3)
  @override
  // TODO: implement part
  int get part => throw UnimplementedError();

  @HiveField(4)
  @override
  // TODO: implement performance
  String get performance => throw UnimplementedError();

  @HiveField(5)
  @override
  // TODO: implement performanceDay
  String get performanceDay => throw UnimplementedError();

  @HiveField(6)
  @override
  // TODO: implement problem
  int get problem => throw UnimplementedError();

  @HiveField(7)
  @override
  // TODO: implement spontan
  String get spontan => throw UnimplementedError();

  @HiveField(8)
  @override
  // TODO: implement spontanDay
  String get spontanDay => throw UnimplementedError();

  @HiveField(9)
  @override
  // TODO: implement stage
  int get stage => throw UnimplementedError();

  @HiveField(10)
  @override
  // TODO: implement team
  String get team => throw UnimplementedError();

  @HiveField(11)
  @override
  late bool isFavourite;
}
