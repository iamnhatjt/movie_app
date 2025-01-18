import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/service/di.dart';
import 'package:movie_app/features/main_page/domain/entities/response_model.dart';
import 'package:movie_app/features/main_page/domain/repositories/list_movie_repository.dart';

part 'page_movie_state.dart';

class PageMovieCubit extends Cubit<PageMovieState> {
  PageMovieCubit() : super(PageMovieInitial());

  int page = 2;

  void getPageMovies(int pageMovie) async {
    try {
      emit(PageMovieLoading());
      final result =
          await getIt<ListMovieRepository>().getListMovie(page: pageMovie);
      page = pageMovie;
      emit(PageMovieLoaded(data: result));
    } on DioException catch (e) {
      emit(PageMovieError(error: e.message ?? ''));
    }
  }

  ResponModel get responModel {
    if (state is PageMovieLoaded) {
      return (state as PageMovieLoaded).data;
    }
    return ResponModel();
  }
}
