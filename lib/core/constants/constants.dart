import 'package:hive_flutter/hive_flutter.dart';
import 'package:movie_app/features/home/data/models/movie_model.dart';

String kMovieBox = 'movieBox';
var movieBox = Hive.box<MovieModel>(kMovieBox);
String baseAssetImageUrl = 'assets/images';
String baseAssetIconsUrl = 'assets/icons';
