part of 'watch_list_cubit.dart';

@immutable
sealed class WatchListState {}

final class WatchListInitialState extends WatchListState {}

final class WatchListLoadingState extends WatchListState {}

final class WatchListSuccessState extends WatchListState {}

final class WatchListFailureState extends WatchListState {
  final String errorMessage;

  WatchListFailureState(this.errorMessage);
}
