import 'package:json_annotation/json_annotation.dart';

part 'city.g.dart';

@JsonSerializable(createToJson: false)
class CityModelApi {
  CityModelApi({
    required this.id,
    required this.name,
  });

  final int id;
  final String name;

  factory CityModelApi.fromJson(Map<String, dynamic> json) => _$CityModelApiFromJson(json);
}
