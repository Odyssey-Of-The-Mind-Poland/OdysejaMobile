import 'package:json_annotation/json_annotation.dart';
import 'info.dart';
import 'info_category.dart';

part 'info_v2.g.dart';

@JsonSerializable(createToJson: false)
class InfoV2Response {
  InfoV2Response({
    required this.infos,
    required this.categories,
  });

  final List<InfoModelApi> infos;
  final List<InfoCategoryModelApi> categories;

  factory InfoV2Response.fromJson(Map<String, dynamic> json) =>
      _$InfoV2ResponseFromJson(json);
}

