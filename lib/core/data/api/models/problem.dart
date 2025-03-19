import 'package:json_annotation/json_annotation.dart';

part 'problem.g.dart';

@JsonSerializable(createToJson: false)
class ProblemModelApi {
  ProblemModelApi({
    required this.id,
    required this.name,
  });

  final int id;
  final String name;

  factory ProblemModelApi.fromJson(Map<String, dynamic> json) => _$ProblemModelApiFromJson(json);
}
