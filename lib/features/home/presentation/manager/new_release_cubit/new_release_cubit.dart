import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import 'package:movie_app/core/utils/failure.dart';
import 'package:movie_app/features/home/data/models/movie_model.dart';
import 'package:movie_app/features/home/data/repos/home_repo.dart';

part 'new_release_state.dart';

class NewReleaseCubit extends Cubit<NewReleaseState> {
  NewReleaseCubit(this.homeRepo) : super(NewReleaseInitialState());
  final HomeRepo homeRepo;

  void fetchNewReleaseMovies() async {
    emit(NewReleaseLoadingState());
    Either<Failure, List<MovieModel>> movies =
        await homeRepo.fetchNewReleasesMovies();
    movies.fold(
      (failure) => emit(NewReleaseFailureState(failure.message)),
      (result) => emit(NewReleaseSuccessState(result)),
    );
  } 
}
