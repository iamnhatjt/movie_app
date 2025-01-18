// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detail_movie_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DetailMovieResponse _$DetailMovieResponseFromJson(Map<String, dynamic> json) =>
    DetailMovieResponse(
      status: json['status'] as bool?,
      msg: json['msg'] as String?,
      movie: json['movie'] == null
          ? null
          : Movie.fromJson(json['movie'] as Map<String, dynamic>),
      episodes: (json['episodes'] as List<dynamic>?)
          ?.map((e) => Episodes.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DetailMovieResponseToJson(
        DetailMovieResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'msg': instance.msg,
      'movie': instance.movie,
      'episodes': instance.episodes,
    };
