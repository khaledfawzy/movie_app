// class GenreModel {
//   final int id;
//   final String name;

//   GenreModel({
//     required this.id,
//     required this.name,
//   });

//   factory GenreModel.fromJson(Map<String, dynamic> json) {
//     return GenreModel(
//       id: json['id'],
//       name: json['name'],
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'id': id,
//       'name': name,
//     };
//   }
// }

// class GenreResponse {
//   final List<GenreModel> genres;

//   GenreResponse.genreResponseModel({
//     required this.genres,
//   });

//   factory GenreResponse.fromJson(Map<String, dynamic> json) {
//     return GenreResponse.genreResponseModel(
//       genres: (json['genres'] as List<dynamic>)
//           .map((item) => GenreModel.fromJson(item as Map<String, dynamic>))
//           .toList(),
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'genres': genres.map((genre) => genre.toJson()).toList(),
//     };
//   }
// }