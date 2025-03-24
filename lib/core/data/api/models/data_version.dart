import 'package:json_annotation/json_annotation.dart';

part 'data_version.g.dart';

@JsonSerializable(createToJson: false)
class DataVersion {
  DataVersion({required this.version});

  final int version;

  factory DataVersion.fromJson(Map<String, dynamic> json) => _$DataVersionFromJson(json);
}
