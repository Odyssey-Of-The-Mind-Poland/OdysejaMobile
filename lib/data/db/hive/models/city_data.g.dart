// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'city_data.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CityDataHiveModelAdapter extends TypeAdapter<CityDataHiveModel> {
  @override
  final int typeId = 0;

  @override
  CityDataHiveModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CityDataHiveModel(
      cityId: fields[0] as int,
      cityName: fields[1] as String,
      infoGroups: (fields[2] as List).cast<InfoGroupHiveModel>(),
      performanceGroups: (fields[3] as List).cast<PerformanceGroupHiveModel>(),
      stages: (fields[4] as List).cast<StageHiveModel>(),
      sponsorModel: (fields[5] as List).cast<SponsorHiveModel>(),
    );
  }

  @override
  void write(BinaryWriter writer, CityDataHiveModel obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.cityId)
      ..writeByte(1)
      ..write(obj.cityName)
      ..writeByte(2)
      ..write(obj.infoGroups)
      ..writeByte(3)
      ..write(obj.performanceGroups)
      ..writeByte(4)
      ..write(obj.stages)
      ..writeByte(5)
      ..write(obj.sponsorModel);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CityDataHiveModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
