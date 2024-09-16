import 'package:movie_app/core/constants/api_constants.dart';

class Movie {
  final bool? adult;
  final String? backdropPath;
  final List<int?>? genreIds;
  final int? id;
  final String? originalLanguage;
  final String? originalTitle;
  final String? overview;
  final double? popularity;
  final String? posterPath;
  final String? releaseDate;
  final String? title;
  final bool? video;
  final double? voteAverage;
  final int? voteCount;

  Movie({
    this.adult,
    this.backdropPath,
    this.genreIds,
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

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      adult: json['adult'],
      backdropPath: json['backdrop_path'],
      genreIds: List<int>.from(json['genre_ids']),
      id: json['id'],
      originalLanguage: json['original_language'],
      originalTitle: json['original_title'],
      overview: json['overview'],
      popularity: json['popularity'].toDouble(),
      posterPath: json['poster_path'],
      releaseDate: json['release_date'],
      title: json['title'],
      video: json['video'],
      voteAverage: json['vote_average'].toDouble(),
      voteCount: json['vote_count'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'adult': adult,
      'backdrop_path': backdropPath,
      'genre_ids': genreIds,
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
    };
  }
}

List<Movie> movies = [
  Movie(
    genreIds: [28, 35, 878],
    id: 533535,
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
  Movie(
    genreIds: [28, 35, 878],
    id: 533535,
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
  Movie(
    genreIds: [28, 35, 878],
    id: 533535,
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
  Movie(
    genreIds: [28, 35, 878],
    id: 533535,
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
  // Add more movies here
];

  // Print movie titles
