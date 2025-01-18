// ignore_for_file: public_member_api_docs, sort_constructors_first, non_constant_identifier_names
// ignore_for_file: depend_on_referenced_packages

import 'package:json_annotation/json_annotation.dart';
import 'package:movie_app/features/main_page/domain/entities/detail_movie/category.dart';
import 'package:movie_app/features/main_page/domain/entities/detail_movie/country.dart';
import 'package:movie_app/features/main_page/domain/entities/detail_movie/time.dart';

part 'movie.g.dart';

@JsonSerializable()
class Movie {
  Time? created;
  Time? modified;
  String? sId;
  String? name;
  String? origin_name;
  String? content;
  String? type;
  String? status;
  String? thumb_url;
  String? trailer_url;
  String? time;
  String? episode_current;
  String? episode_total;
  String? quality;
  String? lang;
  String? notify;
  String? showtimes;
  String? slug;
  int? year;
  int? view;
  List<String>? actor;
  List<String>? director;
  List<Category>? category;
  List<Country>? country;
  bool? isCopyright;
  bool? chieurap;
  String? poster_url;
  bool? subDocquyen;
  Movie({
    this.created,
    this.modified,
    this.sId,
    this.name,
    this.origin_name,
    this.content,
    this.type,
    this.status,
    this.thumb_url,
    this.trailer_url,
    this.time,
    this.episode_current,
    this.episode_total,
    this.quality,
    this.lang,
    this.notify,
    this.showtimes,
    this.slug,
    this.year,
    this.view,
    this.actor,
    this.director,
    this.category,
    this.country,
    this.isCopyright,
    this.chieurap,
    this.poster_url,
    this.subDocquyen,
  });

  factory Movie.fromJson(Map<String, dynamic> json) => _$MovieFromJson(json);

  Map<String, dynamic> toJson() => _$MovieToJson(this);
}
