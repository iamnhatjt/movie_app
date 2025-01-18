// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Movie _$MovieFromJson(Map<String, dynamic> json) => Movie(
      created: json['created'] == null
          ? null
          : Time.fromJson(json['created'] as Map<String, dynamic>),
      modified: json['modified'] == null
          ? null
          : Time.fromJson(json['modified'] as Map<String, dynamic>),
      sId: json['sId'] as String?,
      name: json['name'] as String?,
      origin_name: json['origin_name'] as String?,
      content: json['content'] as String?,
      type: json['type'] as String?,
      status: json['status'] as String?,
      thumb_url: json['thumb_url'] as String?,
      trailer_url: json['trailerUrl'] as String?,
      time: json['time'] as String?,
      episode_current: json['episode_current'] as String?,
      episode_total: json['episode_total'] as String?,
      quality: json['quality'] as String?,
      lang: json['lang'] as String?,
      notify: json['notify'] as String?,
      showtimes: json['showtimes'] as String?,
      slug: json['slug'] as String?,
      year: json['year'] as int?,
      view: json['view'] as int?,
      actor:
          (json['actor'] as List<dynamic>?)?.map((e) => e as String).toList(),
      director: (json['director'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      category: (json['category'] as List<dynamic>?)
          ?.map((e) => Category.fromJson(e as Map<String, dynamic>))
          .toList(),
      country: (json['country'] as List<dynamic>?)
          ?.map((e) => Country.fromJson(e as Map<String, dynamic>))
          .toList(),
      isCopyright: json['isCopyright'] as bool?,
      chieurap: json['chieurap'] as bool?,
      poster_url: json['poster_url'] as String?,
      subDocquyen: json['subDocquyen'] as bool?,
    );

Map<String, dynamic> _$MovieToJson(Movie instance) => <String, dynamic>{
      'created': instance.created,
      'modified': instance.modified,
      'sId': instance.sId,
      'name': instance.name,
      'origin_name': instance.origin_name,
      'content': instance.content,
      'type': instance.type,
      'status': instance.status,
      'thumb_url': instance.thumb_url,
      'trailerUrl': instance.trailer_url,
      'time': instance.time,
      'episode_current': instance.episode_current,
      'episode_total': instance.episode_total,
      'quality': instance.quality,
      'lang': instance.lang,
      'notify': instance.notify,
      'showtimes': instance.showtimes,
      'slug': instance.slug,
      'year': instance.year,
      'view': instance.view,
      'actor': instance.actor,
      'director': instance.director,
      'category': instance.category,
      'country': instance.country,
      'isCopyright': instance.isCopyright,
      'chieurap': instance.chieurap,
      'poster_url': instance.poster_url,
      'subDocquyen': instance.subDocquyen,
    };
