// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'performance_group.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PerformanceGroupHiveModelAdapter
    extends TypeAdapter<PerformanceGroupHiveModel> {
  @override
  final int typeId = 5;

  @override
  PerformanceGroupHiveModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PerformanceGroupHiveModel(
      groupId: (fields[0] as num).toInt(),
      problem: (fields[1] as num).toInt(),
      age: (fields[2] as num).toInt(),
      stage: (fields[3] as num).toInt(),
      part: (fields[4] as num).toInt(),
      league: fields[7] as String,
      day: fields[5] as String,
      performancesHiveList: (fields[6] as HiveList).castHiveList(),
    );
  }

  @override
  void write(BinaryWriter writer, PerformanceGroupHiveModel obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.groupId)
      ..writeByte(1)
      ..write(obj.problem)
      ..writeByte(2)
      ..write(obj.age)
      ..writeByte(3)
      ..write(obj.stage)
      ..writeByte(4)
      ..write(obj.part)
      ..writeByte(5)
      ..write(obj.day)
      ..writeByte(6)
      ..write(obj.performancesHiveList)
      ..writeByte(7)
      ..write(obj.league);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PerformanceGroupHiveModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
