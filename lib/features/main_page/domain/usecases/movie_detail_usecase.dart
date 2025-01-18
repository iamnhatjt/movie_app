import 'package:dio/dio.dart';
import 'package:movie_app/features/main_page/domain/entities/detail_movie/detail_movie_response.dart';
import 'package:retrofit/retrofit.dart';

part 'movie_detail_usecase.g.dart';

@RestApi()
abstract class MovieDetailUsecase {
  factory MovieDetailUsecase(Dio dio, {String baseUrl}) = _MovieDetailUsecase;

  @GET('/phim/{id}')
  Future<DetailMovieResponse> getDetailMovie(@Path() String id);
}
