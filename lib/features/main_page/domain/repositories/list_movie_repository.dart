import 'package:movie_app/core/service/di.dart';
import 'package:movie_app/features/main_page/domain/entities/response_model.dart';
import 'package:movie_app/features/main_page/domain/usecases/list_movie_usecase.dart';

class ListMovieRepository {
  Future<ResponModel> getListMovie({int page = 0}) async {
    try {
      final result = await getIt<ListMovieUsecase>().getListMovie(page);
      return result;
    } catch (e) {
      rethrow;
    }
  }
}
