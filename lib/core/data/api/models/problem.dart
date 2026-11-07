import 'package:json_annotation/json_annotation.dart';

part 'problem.g.dart';

@JsonSerializable(createToJson: false)
class ProblemModelApi {
  ProblemModelApi({
    required this.id,
    required this.name,
    this.icon,
    this.color,
  });

  final int id;
  final String name;
  final String? icon;
  final String? color;

  factory ProblemModelApi.fromJson(Map<String, dynamic> json) => _$ProblemModelApiFromJson(json);
}
