part of 'detail_movie_cubit.dart';

abstract class DetailMovieState extends Equatable {
  const DetailMovieState();

  @override
  List<Object> get props => [];
}

class DetailMovieInitial extends DetailMovieState {}

class DetailMovieLoading extends DetailMovieState {}

class DetailMovieLoaded extends DetailMovieState {
  final DetailMovieResponse result;
  const DetailMovieLoaded(this.result);
  @override
  List<Object> get props => [result];
}

class DetailMovieError extends DetailMovieState {
  final String error;
  const DetailMovieError(this.error);

  @override
  List<Object> get props => [error];
}
