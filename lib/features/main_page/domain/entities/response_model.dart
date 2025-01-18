import 'package:movie_app/features/main_page/domain/entities/movie.dart';
import 'package:movie_app/features/main_page/domain/entities/panigation.dart';

class ResponModel {
  bool? status;
  List<MoviesModel>? items;
  String? pathImage;
  PaginationModel? pagination;

  ResponModel({this.status, this.items, this.pathImage, this.pagination});

  ResponModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['items'] != null) {
      items = <MoviesModel>[];
      json['items'].forEach((v) {
        items!.add(MoviesModel.fromJson(v));
      });
    }
    pathImage = json['pathImage'];
    pagination = json['pagination'] != null
        ? PaginationModel.fromJson(json['pagination'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (items != null) {
      data['items'] = items!.map((v) => v.toJson()).toList();
    }
    data['pathImage'] = pathImage;
    if (pagination != null) {
      data['pagination'] = pagination!.toJson();
    }
    return data;
  }
}
