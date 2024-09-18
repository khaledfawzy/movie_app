// import 'package:movie_app/core/constants/constants.dart';
// import 'package:movie_app/features/home/data/models/movie_model.dart';

// abstract class WatchListRepo {
//   Future<MovieModel> addMovieToWatchList(MovieModel movieItem);
//   List<MovieModel> fetchMoviesFromWatchList();
//   Future<MovieModel> removeMovieFromWatchList();
// }

// class WatchListRepoImpl extends WatchListRepo {
//   @override
//   Future<MovieModel> addMovieToWatchList(movieItem) async{
//     return await movieBox.add(movieItem);
//   }

//   @override
//   List<MovieModel> fetchMoviesFromWatchList() {
//     return movieBox.values.toList();
//   }

//   @override
//   Future<MovieModel> removeMovieFromWatchList() {
//     // TODO: implement removeMovieFromWatchList
//     throw UnimplementedError();
//   }
// }
