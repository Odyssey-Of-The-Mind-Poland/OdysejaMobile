// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'info_v2.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InfoV2Response _$InfoV2ResponseFromJson(Map<String, dynamic> json) =>
    InfoV2Response(
      infos: (json['infos'] as List<dynamic>)
          .map((e) => InfoModelApi.fromJson(e as Map<String, dynamic>))
          .toList(),
      categories: (json['categories'] as List<dynamic>)
          .map((e) => InfoCategoryModelApi.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
