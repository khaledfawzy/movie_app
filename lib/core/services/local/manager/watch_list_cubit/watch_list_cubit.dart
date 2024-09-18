import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movie_app/core/constants/constants.dart';
import 'package:movie_app/features/home/data/models/movie_model.dart';

part 'watch_list_state.dart';

class AddWatchListCubit extends Cubit<WatchListState> {
  AddWatchListCubit() : super(WatchListInitialState());
  addMovieToWatchList(MovieModel movieItem) {
    try {
      emit(WatchListLoadingState());
      movieBox.add(movieItem);
      emit(WatchListSuccessState());
    } catch (e) {
      emit(
        WatchListFailureState(e.toString()),
      );
    }
  }

  removeMovieFromWatchList() {}
}
