import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:movie_app/core/constants/api_constants.dart';
import 'package:movie_app/core/services/network/api_services.dart';
import 'package:movie_app/core/utils/failure.dart';
import 'package:movie_app/features/home/data/models/movie_model.dart';
import 'package:movie_app/features/search/data/repos/search_repo.dart';

abstract class SimilarRepo {
  Future<Either<Failure, List<MovieModel>>> fetchSimilarMovies(int movieId);

}

class SimilarRepoImpl implements SimilarRepo {
  final ApiServices apiServices;

  SimilarRepoImpl(this.apiServices);

  @override
  Future<Either<Failure, List<MovieModel>>> fetchSimilarMovies(int movieId) async {
    try {
      var data = await apiServices
          .get(endPoint: '$movieDetails$movieId$similarMovies', parameters: {'page': 1});

      List<MovieModel> popularMovieList = getMoviesList(data);
      return right(popularMovieList);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }
}
