part of 'page_movie_cubit.dart';

sealed class PageMovieState extends Equatable {
  const PageMovieState();

  @override
  List<Object> get props => [];
}

final class PageMovieInitial extends PageMovieState {}

final class PageMovieLoading extends PageMovieState {}

final class PageMovieLoaded extends PageMovieState {
  final ResponModel data;
  const PageMovieLoaded({required this.data});

  @override
  List<Object> get props => [data];
}

final class PageMovieError extends PageMovieState {
  final String error;
  const PageMovieError({required this.error});

  @override
  List<Object> get props => [error];
}
