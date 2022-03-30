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
    return PerformanceGroupHiveModel();
  }

  @override
  void write(BinaryWriter writer, PerformanceGroupHiveModel obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.age)
      ..writeByte(2)
      ..write(obj.day)
      ..writeByte(3)
      ..write(obj.groupId)
      ..writeByte(4)
      ..write(obj.part)
      ..writeByte(5)
      ..write(obj.performances)
      ..writeByte(6)
      ..write(obj.problem)
      ..writeByte(7)
      ..write(obj.stage);
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
