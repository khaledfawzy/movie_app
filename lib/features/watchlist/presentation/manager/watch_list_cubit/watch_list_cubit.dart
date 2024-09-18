import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movie_app/core/constants/constants.dart';
import 'package:movie_app/features/home/data/models/movie_model.dart';

part 'watch_list_state.dart';

class WatchListCubit extends Cubit<WatchListState> {
  WatchListCubit() : super(WatchListInitialState());
  addMovieToWatchList(MovieModel movieItem) async {
    try {
      emit(WatchListLoadingState());
      await movieBox.add(movieItem);
      emit(WatchListSuccessState());
    } catch (e) {
      emit(
        WatchListFailureState(e.toString()),
      );
    }
  }

  removeMovieFromWatchList(MovieModel selectedMovie) async {
    try {
      emit(WatchListLoadingState());

      // البحث عن الفيلم باستخدام id أو أي خاصية فريدة
      int movieIndex = movieBox.values
          .toList()
          .indexWhere((movie) => movie.id == selectedMovie.id);

      if (movieIndex != -1) {
        await movieBox.deleteAt(movieIndex);
        emit(WatchListSuccessState());
        fetchMoviesFromWatchList();
      } else {
        emit(WatchListFailureState('Movie not found in the watchlist.'));
      }
    } catch (e) {
      emit(WatchListFailureState(e.toString()));
    }
    // try {
    //   emit(WatchListLoadingState());
    //   await selectedMovie.delete();
    //   emit(WatchListSuccessState());
    // } catch (e) {
    //   emit(
    //     WatchListFailureState(e.toString()),
    //   );
    // }
  }

  fetchMoviesFromWatchList() {
    try {
      emit(WatchListLoadingState());
      List<MovieModel> movies = movieBox.values.toList();
      emit(WatchListFetchSuccessState(movies));
    } catch (e) {
      emit(
        WatchListFailureState(e.toString()),
      );
    }
  }
}
