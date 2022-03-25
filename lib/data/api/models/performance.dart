import 'package:json_annotation/json_annotation.dart';

part 'performance.g.dart';

@JsonSerializable(createToJson: false)
class PerformanceModelApi {
  PerformanceModelApi({
    required this.id,
    required this.city,
    required this.team,
    required this.problem,
    required this.age,
    required this.stage,
    required this.performance,
    required this.spontan,
    required this.part,
    required this.performanceDay,
    required this.spontanDay,
  });

  final int id;
  final String city;
  final String team;
  final int problem;
  final int age;
  final int stage;
  final String performance;
  final String spontan;
  final int part;
  final String performanceDay;
  final String spontanDay;

  factory PerformanceModelApi.fromJson(Map<String, dynamic> json) =>
      _$PerformanceModelApiFromJson(json);
}
