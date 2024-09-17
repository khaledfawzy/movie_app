part of 'new_release_cubit.dart';

@immutable
sealed class NewReleaseState {}

final class NewReleaseInitialState extends NewReleaseState {}

final class NewReleaseSuccessState extends NewReleaseState {
  final List<MovieModel> newReleaseMoviesList;

   NewReleaseSuccessState( this.newReleaseMoviesList );
}

final class NewReleaseFailureState extends NewReleaseState {
  final String errorMessage;

   NewReleaseFailureState( this.errorMessage );
}
final class NewReleaseLoadingState extends NewReleaseState {}
