import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import 'package:movie_app/core/utils/failure.dart';
import 'package:movie_app/features/home/data/models/movie_model.dart';
import 'package:movie_app/features/home/data/repos/home_repo.dart';

part 'popular_state.dart';

class PopularCubit extends Cubit<PopularState> {
  PopularCubit(this.homeRepo) : super(PopularInitialState());
  final HomeRepo homeRepo;
  void fetchPopularMovies() async {
    emit(PopularLoadingState());
    Either<Failure, List<MovieModel>> movies =
        await homeRepo.fetchPopularMovies();
    movies.fold(
      (failure) => emit(PopularFailureState(failure.message)),
      (result) => emit(PopularSuccessState(result)),
    );
  }
  
}
