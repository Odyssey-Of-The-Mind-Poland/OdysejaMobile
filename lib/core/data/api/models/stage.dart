import 'package:json_annotation/json_annotation.dart';

part 'stage.g.dart';

@JsonSerializable(createToJson: false)
class StageModelApi {
  StageModelApi({
    required this.id,
    required this.number,
    required this.city,
    required this.name,
    this.icon,
    this.color,
  });

  final int id;
  final int number;
  final int city;
  final String name;
  final String? icon;
  final String? color;

  factory StageModelApi.fromJson(Map<String, dynamic> json) => _$StageModelApiFromJson(json);
}
