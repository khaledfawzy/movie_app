import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movie_app/features/browse/data/repos/browse_repo.dart';
import 'package:movie_app/features/home/data/models/movie_model.dart';

part 'genre_state.dart';

class GenreCubit extends Cubit<GenreState> {
  GenreCubit(this.browseRepo) : super(GenreInitialState());
  final BrowseRepo browseRepo;

  void fetchMoviesByGenre(int genreId) async {
    emit(GenreLoadingState());
    var result = await browseRepo.fetchGenreMovies(genreId);
    result.fold(
      (failure) => emit(GenreFailureState(failure.message)),
      (result) => emit(GenreSuccessState(result)),
    );
  }
}
