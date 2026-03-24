// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'performance_group_v2.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PerformanceGroupV2ModelApi _$PerformanceGroupV2ModelApiFromJson(
        Map<String, dynamic> json) =>
    PerformanceGroupV2ModelApi(
      group: PerformanceGroupInfoV2ModelApi.fromJson(
          json['group'] as Map<String, dynamic>),
      performances: (json['performances'] as List<dynamic>)
          .map((e) => PerformanceModelApi.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

PerformanceGroupInfoV2ModelApi _$PerformanceGroupInfoV2ModelApiFromJson(
        Map<String, dynamic> json) =>
    PerformanceGroupInfoV2ModelApi(
      city: json['city'] as String,
      problem: (json['problem'] as num).toInt(),
      age: (json['age'] as num).toInt(),
      stage: (json['stage'] as num).toInt(),
      part: (json['part'] as num?)?.toInt(),
      league: json['league'] as String?,
      guest: json['guest'] as bool? ?? false,
    );
