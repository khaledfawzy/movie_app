part of 'similar_cubit.dart';

@immutable
sealed class SimilarState {}

final class SimilarInitialState extends SimilarState {}

final class SimilarLoadingState extends SimilarState {}

final class SimilarSuccessState extends SimilarState {
  final List<MovieModel> similarMoviesList;

  SimilarSuccessState( this.similarMoviesList);
}

final class SimilarFailureState extends SimilarState {
  final String errorMessage;

  SimilarFailureState(this.errorMessage);
}
