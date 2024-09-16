import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:movie_app/core/constants/api_constants.dart';
import 'package:movie_app/core/services/network/api_services.dart';
import 'package:movie_app/core/utils/failure.dart';
import 'package:movie_app/features/home/data/models/movie_model.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<MovieModel>>> fetchPopularMovies();
  Future<Either<Failure, List<MovieModel>>> fetchRecommendedMovies();
  Future<Either<Failure, List<MovieModel>>> fetchNewReleasesMovies();
}


class HomeRepoImpl implements HomeRepo{
  final ApiServices apiServices;

  HomeRepoImpl(this.apiServices);

  @override
  Future<Either<Failure, List<MovieModel>>> fetchPopularMovies() async{
    try {
      var data = await apiServices.get(
          endPoint: popularMovies);

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
  
  @override
  Future<Either<Failure, List<MovieModel>>> fetchNewReleasesMovies() async{
   try {
      var data = await apiServices.get(
          endPoint: upcomingMovies);

      List<MovieModel> newReleasesMovieList = getMoviesList(data);
      return right(newReleasesMovieList);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }
  
  @override
  Future<Either<Failure, List<MovieModel>>> fetchRecommendedMovies() async{
   try {
      var data = await apiServices.get(
          endPoint: upcomingMovies);

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