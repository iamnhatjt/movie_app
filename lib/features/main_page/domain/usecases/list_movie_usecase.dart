import 'package:dio/dio.dart';
import 'package:movie_app/features/main_page/domain/entities/response_model.dart';
import 'package:retrofit/retrofit.dart';

part 'list_movie_usecase.g.dart';

@RestApi()
abstract class ListMovieUsecase {
  factory ListMovieUsecase(Dio dio, {String baseUrl}) = _ListMovieUsecase;

  @GET('danh-sach/phim-moi-cap-nhat')
  Future<ResponModel> getListMovie(
    @Query("page") int page,
  );
}
