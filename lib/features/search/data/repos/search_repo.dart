import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:movie_app/core/constants/api_constants.dart';
import 'package:movie_app/core/services/network/api_services.dart';
import 'package:movie_app/core/utils/failure.dart';
import 'package:movie_app/features/home/data/models/movie_model.dart';

abstract class SearchRepo {
  Future<Either<Failure, List<MovieModel>>> fetchSearchResults(
      String searchText);
}

class SearchRepoImpl implements SearchRepo {
  final ApiServices apiServices;

  SearchRepoImpl(this.apiServices);

  @override
  Future<Either<Failure, List<MovieModel>>> fetchSearchResults(
      String searchText) async {
    try {
      var data = await apiServices.get(
          endPoint: searchMovies,
          parameters: {'query': searchText, 'sort_by': 'popularity.desc'});

      List<MovieModel> recommendedMovieList = getMoviesList(data);
      return right(recommendedMovieList);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }
}

List<MovieModel> getMoviesList(List<dynamic> data) {
  List<MovieModel> popularMovieList = [];

  for (var moviesList in data) {
    popularMovieList.add(MovieModel.fromJson(moviesList));
  }
  // print(popularMovieList);

  return popularMovieList;
}
