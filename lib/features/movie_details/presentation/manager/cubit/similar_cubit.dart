import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movie_app/features/home/data/models/movie_model.dart';
import 'package:movie_app/features/movie_details/data/repos/similar_repo.dart';

part 'similar_state.dart';

class SimilarCubit extends Cubit<SimilarState> {
  SimilarCubit(this.similarRepo) : super(SimilarInitialState());
  final SimilarRepo similarRepo;
  void fetchSimilarMovies(int movieId) async {
    emit(SimilarLoadingState());
    await Future.delayed(const Duration(seconds: 1));
    var results = await similarRepo.fetchSimilarMovies(movieId);
    results.fold(
      (failure) => emit(SimilarFailureState(failure.message)),
      (results) => emit(SimilarSuccessState(results)),
    );
  }
}
