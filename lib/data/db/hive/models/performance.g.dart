// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'performance.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PerformanceHiveModelAdapter extends TypeAdapter<PerformanceHiveModel> {
  @override
  final int typeId = 6;

  @override
  PerformanceHiveModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PerformanceHiveModel(
      performanceId: fields[0] as int,
      age: fields[1] as int,
      part: fields[3] as int,
      performance: fields[4] as String,
      performanceDay: fields[5] as String,
      problem: fields[6] as int,
      spontan: fields[7] as String,
      spontanDay: fields[8] as String,
      stage: fields[9] as int,
      league: fields[12] as String,
      team: fields[10] as String,
      isFavourite: fields[11] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, PerformanceHiveModel obj) {
    writer
      ..writeByte(12)
      ..writeByte(0)
      ..write(obj.performanceId)
      ..writeByte(1)
      ..write(obj.age)
      ..writeByte(10)
      ..write(obj.team)
      ..writeByte(3)
      ..write(obj.part)
      ..writeByte(4)
      ..write(obj.performance)
      ..writeByte(5)
      ..write(obj.performanceDay)
      ..writeByte(6)
      ..write(obj.problem)
      ..writeByte(7)
      ..write(obj.spontan)
      ..writeByte(8)
      ..write(obj.spontanDay)
      ..writeByte(9)
      ..write(obj.stage)
      ..writeByte(12)
      ..write(obj.league)
      ..writeByte(11)
      ..write(obj.isFavourite);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PerformanceHiveModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
