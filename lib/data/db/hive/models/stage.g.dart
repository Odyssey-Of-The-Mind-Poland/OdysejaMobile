// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stage.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class StageHiveModelAdapter extends TypeAdapter<StageHiveModel> {
  @override
  final int typeId = 4;

  @override
  StageHiveModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return StageHiveModel(fields[0] as String, (fields[1] as num).toInt());
  }

  @override
  void write(BinaryWriter writer, StageHiveModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.number);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is StageHiveModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
