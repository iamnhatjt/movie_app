import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/service/di.dart';
import 'package:movie_app/features/main_page/domain/entities/detail_movie/detail_movie_response.dart';
import 'package:movie_app/features/main_page/domain/repositories/movie_detail_repository.dart';

part 'detail_movie_state.dart';

class DetailMovieCubit extends Cubit<DetailMovieState> {
  DetailMovieCubit() : super(DetailMovieInitial());

  Future<void> getDetailMovie(String slug) async {
    try {
      emit(DetailMovieLoading());
      final result = await getIt<MovieDetailRepository>().getMovieDetail(slug);
      emit(DetailMovieLoaded(result));
    } on DioException catch (e) {
      emit(DetailMovieError(e.message ?? ''));
    }
  }

  DetailMovieResponse detailMovie() {
    if (state is DetailMovieLoaded) {
      return (state as DetailMovieLoaded).result;
    }
    return DetailMovieResponse();
  }
}
