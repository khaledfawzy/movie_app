import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movie_app/features/home/data/models/movie_model.dart';
import 'package:movie_app/features/movie_details/data/repos/details_repo.dart';

part 'details_state.dart';

class DetailsCubit extends Cubit<DetailsState> {
  DetailsCubit(this.detailsRepo) : super(DetailsInitialState());
  final DetailsRepo detailsRepo;
  void fetchMovieDetails(int movieId) async {
    emit(DetailsLoadingState());
    await Future.delayed(const Duration(seconds: 1));
    var results = await detailsRepo.fetchMovieDetails(movieId);
    results.fold(
      (failure) => emit(DetailsFailureState(failure.message)),
      (results) => emit(DetailsSuccessState(results)),
    );
  }
}
