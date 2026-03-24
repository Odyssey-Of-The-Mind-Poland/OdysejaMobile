import 'package:json_annotation/json_annotation.dart';
import 'package:odyssey_mobile/core/data/api/models/performance.dart';

part 'performance_group_v2.g.dart';

@JsonSerializable(createToJson: false)
class PerformanceGroupV2ModelApi {
  PerformanceGroupV2ModelApi({
    required this.group,
    required this.performances,
  });

  final PerformanceGroupInfoV2ModelApi group;
  final List<PerformanceModelApi> performances;

  factory PerformanceGroupV2ModelApi.fromJson(Map<String, dynamic> json) =>
      _$PerformanceGroupV2ModelApiFromJson(json);
}

@JsonSerializable(createToJson: false)
class PerformanceGroupInfoV2ModelApi {
  PerformanceGroupInfoV2ModelApi({
    required this.city,
    required this.problem,
    required this.age,
    required this.stage,
    required this.part,
    required this.league,
    required this.guest,
  });

  final String city;
  final int problem;
  final int age;
  final int stage;
  final int? part;
  final String? league;
  @JsonKey(defaultValue: false)
  final bool guest;

  factory PerformanceGroupInfoV2ModelApi.fromJson(Map<String, dynamic> json) =>
      _$PerformanceGroupInfoV2ModelApiFromJson(json);
}
