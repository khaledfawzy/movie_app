part of 'details_cubit.dart';

@immutable
sealed class DetailsState {}

final class DetailsInitialState extends DetailsState {}

final class DetailsLoadingState extends DetailsState {}

final class DetailsSuccessState extends DetailsState {
  final MovieModel movieDetails;

  DetailsSuccessState(this.movieDetails);
}

final class DetailsFailureState extends DetailsState {
  final String errorMessage;

  DetailsFailureState(this.errorMessage);
}