import 'package:movie_app/core/constants/constants.dart';

class GenreModel {
  final int id;
  final String name;
  final String imgUrl;
  GenreModel({
    required this.id,
    required this.name,
    required this.imgUrl,
  });
}

final List<GenreModel> genres = [
  GenreModel(
    id: 28,
    name: "Action",
  imgUrl: '$baseAssetImageUrl/action.webp'),
  GenreModel(
    id: 12,
    name: "Adventure",
  imgUrl: '$baseAssetImageUrl/Adventure.jpeg'),
  GenreModel(
    id: 16,
    name: "Animation",
  imgUrl: '$baseAssetImageUrl/Animation.jpeg'),
  GenreModel(
    id: 35,
    name: "Comedy",
  imgUrl: '$baseAssetImageUrl/Comedy.jpg'),
  GenreModel(
    id: 80,
    name: "Crime",
  imgUrl: '$baseAssetImageUrl/Crime.jpeg'),
  GenreModel(
    id: 99,
    name: "Documentary",
  imgUrl: '$baseAssetImageUrl/Documentary.jpeg'),
  GenreModel(
    id: 18,
    name: "Drama",
  imgUrl: '$baseAssetImageUrl/Drama.jpeg'),
  GenreModel(
    id: 10751,
    name: "Family",
  imgUrl: '$baseAssetImageUrl/Family.jpeg'),
  GenreModel(
    id: 14,
    name: "Fantasy",
  imgUrl: '$baseAssetImageUrl/Fantasy.jpeg'),
  GenreModel(
    id: 36,
    name: "History",
  imgUrl: '$baseAssetImageUrl/History.jpeg'),
  GenreModel(
    id: 27,
    name: "Horror",
  imgUrl: '$baseAssetImageUrl/Horror.jpeg'),
  GenreModel(
    id: 10402,
    name: "Music",
  imgUrl: '$baseAssetImageUrl/Music.jpeg'),
  GenreModel(
    id: 9648,
    name: "Mystery",
  imgUrl: '$baseAssetImageUrl/Mystery.jpg'),
  GenreModel(
    id: 10749,
    name: "Romance",
  imgUrl: '$baseAssetImageUrl/Romance.jpeg'),
  GenreModel(
    id: 878,
    name: "Science Fiction",
  imgUrl: '$baseAssetImageUrl/Science Fiction.jpeg'),
  GenreModel(
    id: 10770,
    name: "TV Movie",
  imgUrl: '$baseAssetImageUrl/TV Movie.jpeg'),
  GenreModel(
    id: 53,
    name: "Thriller",
  imgUrl: '$baseAssetImageUrl/Thriller.jpeg'),
  GenreModel(
    id: 10752,
    name: "War",
  imgUrl: '$baseAssetImageUrl/War.jpeg'),
  GenreModel(
    id: 37,
    name: "Western",
  imgUrl: '$baseAssetImageUrl/Western.jpeg'),
];
