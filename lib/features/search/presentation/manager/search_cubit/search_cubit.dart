import 'package:bloc/bloc.dart';
import 'package:movie_app/features/home/data/models/movie_model.dart';
import 'package:movie_app/features/search/data/repos/search_repo.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this.searchRepo) : super(SearchInitialState());
  final SearchRepo searchRepo;
  void searchMovies(String searchText) async {
    emit(SearchLoadingState());
    await Future.delayed(const Duration(seconds: 1));
    var results = await searchRepo.fetchSearchResults(searchText);
    results.fold(
      (failure) => emit(SearchFailureState(failure.message)),
      (results) => emit(SearchResultsState(results)),
    );
  }
}
