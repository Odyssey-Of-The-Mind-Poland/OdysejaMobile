import 'package:json_annotation/json_annotation.dart';

part 'sponsor.g.dart';

@JsonSerializable(createToJson: false)
class SponsorModelApi {
  SponsorModelApi({
    required this.id,
    required this.row,
    required this.column,
  });

  final int id;
  final int row;
  final int column;

  factory SponsorModelApi.fromJson(Map<String, dynamic> json) => _$SponsorModelApiFromJson(json);
}
