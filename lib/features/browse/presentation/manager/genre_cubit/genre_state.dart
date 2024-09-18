part of 'genre_cubit.dart';

@immutable
sealed class GenreState {}

final class GenreInitialState extends GenreState {}
final class GenreLoadingState extends GenreState {}
final class GenreSuccessState extends GenreState {
  final List<MovieModel> genreList;

  GenreSuccessState(this.genreList);
}
final class GenreFailureState extends GenreState {
  final String errorMessage;

  GenreFailureState(this.errorMessage);
}
