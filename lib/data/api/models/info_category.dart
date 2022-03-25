import 'package:json_annotation/json_annotation.dart';

part 'info_category.g.dart';

@JsonSerializable(createToJson: false)
class InfoCategoryModelApi {
  InfoCategoryModelApi({
    required this.id,
    required this.name,
  });

  final int id;
  final String name;

  factory InfoCategoryModelApi.fromJson(Map<String, dynamic> json) =>
      _$InfoCategoryModelApiFromJson(json);
}
