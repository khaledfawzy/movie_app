part of 'popular_cubit.dart';

@immutable
sealed class PopularState {}

final class PopularInitialState extends PopularState {}
final class PopularSuccessState extends PopularState {
  final List<MovieModel> popularMoviesList;

   PopularSuccessState( this.popularMoviesList );
}

final class PopularFailureState extends PopularState {
  final String errorMessage;

   PopularFailureState( this.errorMessage );
}
final class PopularLoadingState extends PopularState {}
