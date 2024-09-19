import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:movie_app/core/constants/api_constants.dart';
import 'package:movie_app/core/services/network/api_services.dart';
import 'package:movie_app/core/utils/failure.dart';
import 'package:movie_app/features/home/data/models/movie_model.dart';

abstract class BrowseRepo {
  Future<Either<Failure, List<MovieModel>>> fetchGenreMovies(int genreId);
}

class BrowseRepoImpl implements BrowseRepo {
  final ApiServices apiServices;

  BrowseRepoImpl(this.apiServices);

  @override
  Future<Either<Failure, List<MovieModel>>> fetchGenreMovies(
      int genreId) async {
    try {
      var data = await apiServices.get(endPoint: moviesCategory, parameters: {
        'with_genres': genreId,
        'page': 1,
        'sort_by': 'popularity.desc'
      });

      List<MovieModel> genreMovieList = getMoviesList(data);
      return right(genreMovieList);
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

  return popularMovieList;
}
