import 'package:json_annotation/json_annotation.dart';

part 'stage.g.dart';

@JsonSerializable(createToJson: false)
class StageModelApi {
  StageModelApi({
    required this.id,
    required this.number,
    required this.city,
    required this.name,
  });

  final int id;
  final int number;
  final int city;
  final String name;

  factory StageModelApi.fromJson(Map<String, dynamic> json) => _$StageModelApiFromJson(json);
}
