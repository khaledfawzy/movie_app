part of 'recommended_cubit.dart';

@immutable
sealed class RecommendedState {}

final class RecommendedInitialState extends RecommendedState {}
final class RecommendedLoadingState extends RecommendedState {}
final class RecommendedFailureState extends RecommendedState {
  final String error;

  RecommendedFailureState(this.error);
}

final class RecommendedSuccessState extends RecommendedState {
  final List<MovieModel> recommendedList;

  RecommendedSuccessState(this.recommendedList);
}
