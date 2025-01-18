import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/service/di.dart';
import 'package:movie_app/features/main_page/domain/entities/response_model.dart';
import 'package:movie_app/features/main_page/domain/repositories/list_movie_repository.dart';

part 'list_movie_state.dart';

class ListMovieCubit extends Cubit<ListMovieState> {
  ListMovieCubit() : super(ListMovieInitial());

  Future<void> getListMovie({int page = 0}) async {
    try {
      emit(ListMovieLoading());
      final result =
          await getIt<ListMovieRepository>().getListMovie(page: page);
      emit(ListMovieLoaded(result: result));
    } on DioException catch (e) {
      emit(ListMovieError(error: e.message ?? ''));
    }
  }

  ResponModel listMovie() {
    if (state is ListMovieLoaded) {
      return (state as ListMovieLoaded).result;
    }
    return ResponModel();
  }
}
