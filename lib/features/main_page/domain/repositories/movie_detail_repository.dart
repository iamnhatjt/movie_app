import 'package:movie_app/core/service/di.dart';
import 'package:movie_app/features/main_page/domain/entities/detail_movie/detail_movie_response.dart';
import 'package:movie_app/features/main_page/domain/usecases/movie_detail_usecase.dart';

class MovieDetailRepository {
  Future<DetailMovieResponse> getMovieDetail(String id) async {
    try {
      final result = await getIt<MovieDetailUsecase>().getDetailMovie(id);
      return result;
    } catch (e) {
      rethrow;
    }
  }
}
