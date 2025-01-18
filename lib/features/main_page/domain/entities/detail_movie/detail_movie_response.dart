// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: depend_on_referenced_packages

import 'package:json_annotation/json_annotation.dart';
import 'package:movie_app/features/main_page/domain/entities/detail_movie/episodes.dart';
import 'package:movie_app/features/main_page/domain/entities/detail_movie/movie.dart';

part 'detail_movie_response.g.dart';

@JsonSerializable()
class DetailMovieResponse {
  bool? status;
  String? msg;
  Movie? movie;
  List<Episodes>? episodes;
  DetailMovieResponse({
    this.status,
    this.msg,
    this.movie,
    this.episodes,
  });

  factory DetailMovieResponse.fromJson(Map<String, dynamic> json) =>
      _$DetailMovieResponseFromJson(json);

  Map<String, dynamic> toJson() => _$DetailMovieResponseToJson(this);
}
