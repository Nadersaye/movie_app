import 'package:movie_app/movies/domain/entities/movie.dart';

class MovieModel extends Movie {
  const MovieModel(
      {required super.id,
      required super.title,
      required super.genreIds,
      required super.backdropPath,
      required super.overview,
      required super.posterPath,
      required super.voteAverage,
      required super.releaseDate});

  factory MovieModel.fromJson(Map<String, dynamic> json) => MovieModel(
      id: json["id"],
      title: json["title"],
      genreIds: List<int>.from(json["genre_ids"].map((e) => e)),
      backdropPath: json["backdrop_path"],
      overview: json["overview"],
      posterPath: json["poster_path"],
      voteAverage: json["vote_average"].toDouble(),
      releaseDate: json["release_date"]);
}
