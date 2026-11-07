import 'package:json_annotation/json_annotation.dart';

part 'age.g.dart';

/// The style of an age group tile (0 = juniors, 1-4 = divisions I-IV); both fields are null until editors set them.
@JsonSerializable(createToJson: false)
class AgeModelApi {
  AgeModelApi({
    required this.id,
    this.icon,
    this.color,
  });

  final int id;
  final String? icon;
  final String? color;

  factory AgeModelApi.fromJson(Map<String, dynamic> json) => _$AgeModelApiFromJson(json);
}
