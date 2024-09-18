part of 'search_cubit.dart';

sealed class SearchState {}

final class SearchInitialState extends SearchState {}

final class SearchLoadingState extends SearchState {}

final class SearchResultsState extends SearchState {
  final List<MovieModel> searchResultList;

  SearchResultsState(this.searchResultList);
}

final class SearchFailureState extends SearchState {
  final String errorMessage;

  SearchFailureState(this.errorMessage);
}
