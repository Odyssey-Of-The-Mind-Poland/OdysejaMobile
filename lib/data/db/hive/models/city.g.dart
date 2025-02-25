// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'city.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CityHiveModelAdapter extends TypeAdapter<CityHiveModel> {
  @override
  final int typeId = 8;

  @override
  CityHiveModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CityHiveModel(fields[0] as String, (fields[1] as num).toInt());
  }

  @override
  void write(BinaryWriter writer, CityHiveModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.id);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CityHiveModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
