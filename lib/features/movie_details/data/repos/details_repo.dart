import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:movie_app/core/constants/api_constants.dart';
import 'package:movie_app/core/services/network/api_services.dart';
import 'package:movie_app/core/utils/failure.dart';
import 'package:movie_app/features/home/data/models/movie_model.dart';

abstract class DetailsRepo {
  Future<Either<Failure, MovieModel>> fetchMovieDetails(
      int movieId);
}

class DetailsRepoImpl implements DetailsRepo {
  final ApiServices apiServices;

  DetailsRepoImpl(this.apiServices);

  @override
  Future<Either<Failure, MovieModel>> fetchMovieDetails(int
      movieId) async {
    try {
      var data = await apiServices
          .get2(endPoint: '$movieDetails$movieId?');

      // List<MovieModel> movieDetailsList = getMoviesList(data);
      return right(MovieModel.fromJson(data));
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }
}
