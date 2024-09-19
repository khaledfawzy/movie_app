import 'package:hive/hive.dart';
import 'package:movie_app/core/constants/api_constants.dart';

part 'movie_model.g.dart';


@HiveType(typeId: 0)
class MovieModel extends HiveObject {
  @HiveField(0)
  final bool? adult;
  @HiveField(1)
  final String? backdropPath;
  // final List<int?>? genreIds;
  @HiveField(2)
  final int? id;
  @HiveField(3)
  final String? originalLanguage;
  @HiveField(4)
  final String? originalTitle;
  @HiveField(5)
  final String? overview;
  @HiveField(6)
  final double? popularity;
  @HiveField(7)
  final String? posterPath;
  @HiveField(8)
  final String? releaseDate;
  @HiveField(9)
  final String? title;
  @HiveField(10)
  final bool? video;
  @HiveField(11)
  final double? voteAverage;
  @HiveField(12)
  final int? voteCount;
  @HiveField(13)
  final int? time;

  MovieModel({
    this.time,
    this.adult,
    this.backdropPath,
    // this.genreIds,
    this.id,
    this.originalLanguage,
    this.originalTitle,
    this.overview,
    this.popularity,
    this.posterPath,
    this.releaseDate,
    this.title,
    this.video,
    this.voteAverage,
    this.voteCount,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
      adult: json['adult'],
      backdropPath: json['backdrop_path'],
      // genreIds: List<int>.from(json['genre_ids']).isEmpty?[18],
      id: json['id'],
      originalLanguage: json['original_language'],
      originalTitle: json['original_title'],
      overview: json['overview'],
      popularity: json['popularity'],
      posterPath: json['poster_path'],
      releaseDate: json['release_date'],
      title: json['title'],
      video: json['video'],
      voteAverage: json['vote_average'],
      voteCount: json['vote_count'],
      time: json['runtime'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'adult': adult,
      'backdrop_path': backdropPath,
      // 'genre_ids': genreIds,
      'id': id,
      'original_language': originalLanguage,
      'original_title': originalTitle,
      'overview': overview,
      'popularity': popularity,
      'poster_path': posterPath,
      'release_date': releaseDate,
      'title': title,
      'video': video,
      'vote_average': voteAverage,
      'vote_count': voteCount,
      'runtime': time,
    };
  }
}

List<MovieModel> movies = [
  MovieModel(
    // genreIds: [28, 35, 878],
    id: 533535,
    originalLanguage: "en",
    time: 128,
    originalTitle: "Deadpool & Wolverine",
    backdropPath: "$baseImageUrl/waPt1Dv5kWhbNna5rTv2NGfeb7O.jpg",
    overview:
        "A listless Wade Wilson toils away in civilian life with his days as the morally flexible mercenary, Deadpool, behind him. But when his homeworld faces an existential threat, Wade must reluctantly suit-up again with an even more reluctant Wolverine.",
    popularity: 2680.931,
    posterPath: "$baseImageUrl/8cdWjvZQUExUUTzyp4t6EDMubfO.jpg",
    releaseDate: "2024-07-24",
    title: "Deadpool & Wolverine",
    voteAverage: 7.7,
  ),
  MovieModel(
    // genreIds: [28, 35, 878],
    id: 533535,
    time: 128,
    backdropPath: "$baseImageUrl/waPt1Dv5kWhbNna5rTv2NGfeb7O.jpg",
    originalLanguage: "en",
    originalTitle: "Deadpool & Wolverine",
    overview:
        "A listless Wade Wilson toils away in civilian life with his days as the morally flexible mercenary, Deadpool, behind him. But when his homeworld faces an existential threat, Wade must reluctantly suit-up again with an even more reluctant Wolverine.",
    popularity: 2680.931,
    posterPath: "$baseImageUrl/8cdWjvZQUExUUTzyp4t6EDMubfO.jpg",
    releaseDate: "2024-07-24",
    title: "Deadpool & Wolverine",
    voteAverage: 7.7,
  ),
  MovieModel(
    // genreIds: [28, 35, 878],
    id: 533535,
    originalLanguage: "en",
    time: 128,
    backdropPath: "$baseImageUrl/waPt1Dv5kWhbNna5rTv2NGfeb7O.jpg",
    originalTitle: "Deadpool & Wolverine",
    overview:
        "A listless Wade Wilson toils away in civilian life with his days as the morally flexible mercenary, Deadpool, behind him. But when his homeworld faces an existential threat, Wade must reluctantly suit-up again with an even more reluctant Wolverine.",
    popularity: 2680.931,
    posterPath: "$baseImageUrl/8cdWjvZQUExUUTzyp4t6EDMubfO.jpg",
    releaseDate: "2024-07-24",
    title: "Deadpool & Wolverine",
    voteAverage: 7.7,
  ),
  MovieModel(
    // genreIds: [28, 35, 878],
    id: 533535,
    originalLanguage: "en",
    time: 128,
    originalTitle: "Deadpool & Wolverine",
    backdropPath: "$baseImageUrl/waPt1Dv5kWhbNna5rTv2NGfeb7O.jpg",
    overview:
        "A listless Wade Wilson toils away in civilian life with his days as the morally flexible mercenary, Deadpool, behind him. But when his homeworld faces an existential threat, Wade must reluctantly suit-up again with an even more reluctant Wolverine.",
    popularity: 2680.931,
    posterPath: "$baseImageUrl/8cdWjvZQUExUUTzyp4t6EDMubfO.jpg",
    releaseDate: "2024-07-24",
    title: "Deadpool & Wolverine",
    voteAverage: 7.7,
  ),
  // Add more movies here
];

  // Print movie titles
