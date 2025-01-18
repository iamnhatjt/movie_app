// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'server_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ServerData _$ServerDataFromJson(Map<String, dynamic> json) => ServerData(
      name: json['name'] as String?,
      slug: json['slug'] as String?,
      filename: json['filename'] as String?,
      link_embed: json['link_embed'] as String?,
      link_m3u8: json['link_m3u8'] as String?,
    );

Map<String, dynamic> _$ServerDataToJson(ServerData instance) =>
    <String, dynamic>{
      'name': instance.name,
      'slug': instance.slug,
      'filename': instance.filename,
      'link_embed': instance.link_embed,
      'link_m3u8': instance.link_m3u8,
    };
