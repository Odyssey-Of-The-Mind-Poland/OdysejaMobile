import 'package:json_annotation/json_annotation.dart';

part 'info.g.dart';

@JsonSerializable(createToJson: false)
class InfoModelApi {
  InfoModelApi({
    required this.id,
    required this.infoName,
    required this.infoText,
    required this.city,
    required this.category,
  });

  final int id;
  final String infoName;
  final String infoText;
  final int city;
  final int category;

  factory InfoModelApi.fromJson(Map<String, dynamic> json) => _$InfoModelApiFromJson(json);
}
