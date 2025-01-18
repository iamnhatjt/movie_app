// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'episodes.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Episodes _$EpisodesFromJson(Map<String, dynamic> json) => Episodes(
      serverName: json['serverName'] as String?,
      server_data: (json['server_data'] as List<dynamic>?)
          ?.map((e) => ServerData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$EpisodesToJson(Episodes instance) => <String, dynamic>{
      'serverName': instance.serverName,
      'server_data': instance.server_data,
    };
