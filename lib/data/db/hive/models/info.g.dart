// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'info.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class InfoHiveModelAdapter extends TypeAdapter<InfoHiveModel> {
  @override
  final int typeId = 2;

  @override
  InfoHiveModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return InfoHiveModel(
      (fields[0] as num).toInt(),
      fields[1] as String,
      fields[2] as String,
      (fields[3] as num).toInt(),
    );
  }

  @override
  void write(BinaryWriter writer, InfoHiveModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.number)
      ..writeByte(1)
      ..write(obj.infoName)
      ..writeByte(2)
      ..write(obj.infoText)
      ..writeByte(3)
      ..write(obj.sortNumber);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is InfoHiveModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
