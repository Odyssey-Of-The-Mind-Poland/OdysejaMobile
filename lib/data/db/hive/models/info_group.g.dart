// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'info_group.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class InfoGroupHiveModelAdapter extends TypeAdapter<InfoGroupHiveModel> {
  @override
  final int typeId = 1;

  @override
  InfoGroupHiveModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return InfoGroupHiveModel(
      (fields[0] as num).toInt(),
      fields[1] as String,
      (fields[2] as List).cast<InfoHiveModel>(),
    );
  }

  @override
  void write(BinaryWriter writer, InfoGroupHiveModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.number)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.info);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is InfoGroupHiveModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
