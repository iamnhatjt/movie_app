part of 'list_movie_cubit.dart';

abstract class ListMovieState extends Equatable {
  const ListMovieState();

  @override
  List<Object> get props => [];
}

class ListMovieInitial extends ListMovieState {}

class ListMovieLoading extends ListMovieState {}

class ListMovieLoaded extends ListMovieState {
  final ResponModel result;
  const ListMovieLoaded({required this.result});

  @override
  List<Object> get props => [result];
}

class ListMovieError extends ListMovieState {
  final String error;
  const ListMovieError({required this.error});

  @override
  List<Object> get props => [error];
}
