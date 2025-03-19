// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hive_service.dart';

// **************************************************************************
// AdaptersGenerator
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
      cityId: (fields[0] as num).toInt(),
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

class CityHiveModelAdapter extends TypeAdapter<CityHiveModel> {
  @override
  final int typeId = 1;

  @override
  CityHiveModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CityHiveModel(
      fields[0] as String,
      (fields[1] as num).toInt(),
    );
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

class InfoGroupHiveModelAdapter extends TypeAdapter<InfoGroupHiveModel> {
  @override
  final int typeId = 3;

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

class InfoHiveModelAdapter extends TypeAdapter<InfoHiveModel> {
  @override
  final int typeId = 4;

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
      performanceId: (fields[0] as num).toInt(),
      age: (fields[1] as num).toInt(),
      part: (fields[3] as num).toInt(),
      performance: fields[4] as String,
      performanceDay: fields[5] as String,
      problem: (fields[6] as num).toInt(),
      spontan: fields[7] as String,
      spontanDay: fields[8] as String,
      stage: (fields[9] as num).toInt(),
      league: fields[10] as String,
      team: fields[2] as String,
      isFavourite: fields[11] as bool,
      performanceDate: fields[12] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, PerformanceHiveModel obj) {
    writer
      ..writeByte(13)
      ..writeByte(0)
      ..write(obj.performanceId)
      ..writeByte(1)
      ..write(obj.age)
      ..writeByte(2)
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
      ..writeByte(10)
      ..write(obj.league)
      ..writeByte(11)
      ..write(obj.isFavourite)
      ..writeByte(12)
      ..write(obj.performanceDate);
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

class ProblemHiveModelAdapter extends TypeAdapter<ProblemHiveModel> {
  @override
  final int typeId = 7;

  @override
  ProblemHiveModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ProblemHiveModel(
      fields[0] as String,
      (fields[1] as num).toInt(),
    );
  }

  @override
  void write(BinaryWriter writer, ProblemHiveModel obj) {
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
      other is ProblemHiveModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class SponsorHiveModelAdapter extends TypeAdapter<SponsorHiveModel> {
  @override
  final int typeId = 8;

  @override
  SponsorHiveModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SponsorHiveModel(
      (fields[0] as num).toInt(),
      (fields[1] as num).toInt(),
      (fields[2] as num).toInt(),
    );
  }

  @override
  void write(BinaryWriter writer, SponsorHiveModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.row)
      ..writeByte(2)
      ..write(obj.column);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SponsorHiveModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class StageHiveModelAdapter extends TypeAdapter<StageHiveModel> {
  @override
  final int typeId = 9;

  @override
  StageHiveModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return StageHiveModel(
      fields[0] as String,
      (fields[1] as num).toInt(),
    );
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
