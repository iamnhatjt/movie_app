// ignore_for_file: depend_on_referenced_packages, non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';
import 'package:movie_app/features/main_page/domain/entities/detail_movie/server_data.dart';

part 'episodes.g.dart';

@JsonSerializable()
class Episodes {
  String? serverName;
  List<ServerData>? server_data;
  Episodes({
    this.serverName,
    this.server_data,
  });

  factory Episodes.fromJson(Map<String, dynamic> json) =>
      _$EpisodesFromJson(json);

  Map<String, dynamic> toJson() => _$EpisodesToJson(this);
}
