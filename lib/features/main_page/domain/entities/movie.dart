class MoviesModel {
  ModifiedModel? modified;
  String? sId;
  String? name;
  String? originName;
  String? thumbUrl;
  String? posterUrl;
  String? slug;
  int? year;

  MoviesModel(
      {this.modified,
      this.sId,
      this.name,
      this.originName,
      this.thumbUrl,
      this.posterUrl,
      this.slug,
      this.year});

  MoviesModel.fromJson(Map<String, dynamic> json) {
    modified =
        json['modified'] != null ? ModifiedModel.fromJson(json['modified']) : null;
    sId = json['_id'];
    name = json['name'];
    originName = json['origin_name'];
    thumbUrl = json['thumb_url'];
    posterUrl = json['poster_url'];
    slug = json['slug'];
    year = json['year'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (modified != null) {
      data['modified'] = modified!.toJson();
    }
    data['_id'] = sId;
    data['name'] = name;
    data['origin_name'] = originName;
    data['thumb_url'] = thumbUrl;
    data['poster_url'] = posterUrl;
    data['slug'] = slug;
    data['year'] = year;
    return data;
  }
}

class ModifiedModel {
  String? time;

  ModifiedModel({this.time});

  ModifiedModel.fromJson(Map<String, dynamic> json) {
    time = json['time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['time'] = time;
    return data;
  }
}
