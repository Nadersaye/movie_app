import 'package:movie_app/movies/data/models/genres_model.dart';
import '../../domain/entities/movie_details.dart';

class MovieDetailsModel extends MovieDetails {
  const MovieDetailsModel(
      {required super.id,
      required super.title,
      required super.genres,
      required super.backdropPath,
      required super.overview,
      required super.releaseDate,
      required super.voteAverage,
      required super.runtime});

  factory MovieDetailsModel.fromJson(Map<String, dynamic> json) =>
      MovieDetailsModel(
          id: json['id'],
          title: json['title'],
          genres:
              List.from(json['genres'].map((e) => GeneresModel.fromJson(e))),
          backdropPath: json['backdrop_path'],
          overview: json['overview'],
          releaseDate: json['release_date'],
          voteAverage: json['vote_average'].toDouble(),
          runtime: json['runtime']);
}
