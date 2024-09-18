import 'package:hive_flutter/hive_flutter.dart';
import 'package:movie_app/features/home/data/models/movie_model.dart';

Box<MovieModel> movieBox = Hive.box<MovieModel>('movieBox');
String kMovieBox = 'movieBox';
