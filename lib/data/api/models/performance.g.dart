// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'performance.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PerformanceModelApi _$PerformanceModelApiFromJson(Map<String, dynamic> json) =>
    PerformanceModelApi(
      id: (json['id'] as num).toInt(),
      city: json['city'] as String,
      team: json['team'] as String,
      problem: (json['problem'] as num).toInt(),
      age: (json['age'] as num).toInt(),
      stage: (json['stage'] as num).toInt(),
      performance: json['performance'] as String,
      spontan: json['spontan'] as String,
      part: (json['part'] as num).toInt(),
      league: json['league'] as String,
      performanceDay: json['performanceDay'] as String,
      spontanDay: json['spontanDay'] as String,
    );
