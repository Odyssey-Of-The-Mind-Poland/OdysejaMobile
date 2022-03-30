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
    return PerformanceHiveModel()..isFavourite = fields[11] as bool;
  }

  @override
  void write(BinaryWriter writer, PerformanceHiveModel obj) {
    writer
      ..writeByte(12)
      ..writeByte(11)
      ..write(obj.isFavourite)
      ..writeByte(0)
      ..write(obj.performanceId)
      ..writeByte(1)
      ..write(obj.age)
      ..writeByte(2)
      ..write(obj.groupId)
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
      ..writeByte(10)
      ..write(obj.team);
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
