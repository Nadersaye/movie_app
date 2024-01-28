import 'package:equatable/equatable.dart';
import 'package:movie_app/movies/domain/entities/genres.dart';

class MovieDetails extends Equatable {
  final int id;
  final String title;
  final List<Generes> genres;
  final String backdropPath;
  final String overview;
  final String releaseDate;
  final double voteAverage;
  final int runtime;

  const MovieDetails(
      {required this.id,
      required this.title,
      required this.genres,
      required this.backdropPath,
      required this.overview,
      required this.releaseDate,
      required this.voteAverage,
      required this.runtime});

  @override
  List<Object?> get props => [
        id,
        title,
        genres,
        backdropPath,
        overview,
        releaseDate,
        voteAverage,
        runtime,
      ];
}
