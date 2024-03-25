import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit/retrofit.dart';

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

  static List<List<SponsorModelApi>> fromHttpResponse(HttpResponse<dynamic> response) =>
      (response.data as List)
          .map((i) => (i as List)
              .map((item) => SponsorModelApi.fromJson(item as Map<String, dynamic>))
              .toList(growable: false))
          .toList();
}
