import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import 'package:movie_app/core/utils/failure.dart';
import 'package:movie_app/features/home/data/models/movie_model.dart';
import 'package:movie_app/features/home/data/repos/home_repo.dart';

part 'recommended_state.dart';

class RecommendedCubit extends Cubit<RecommendedState> {
  RecommendedCubit(this.homeRepo) : super(RecommendedInitialState());
  final HomeRepo homeRepo;
  void fetchRecommendedMovies() async {
    emit(RecommendedLoadingState());
    Either<Failure, List<MovieModel>> result =
        await homeRepo.fetchRecommendedMovies();
    result.fold(
      (failure) => emit(RecommendedFailureState(failure.message)),
      (result) => emit(RecommendedSuccessState(result)),
    );
  }
}
