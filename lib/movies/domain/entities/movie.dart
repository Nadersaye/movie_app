import 'package:equatable/equatable.dart';

class Movie extends Equatable {
  final int id;
  final String title;
  final List<int> genreIds;
  final String backdropPath;
  final String overview;
  final String posterPath;
  final double voteAverage;
  final String releaseDate;

  const Movie(
      {required this.id,
      required this.title,
      required this.genreIds,
      required this.backdropPath,
      required this.overview,
      required this.posterPath,
      required this.voteAverage,
      required this.releaseDate});

  @override
  List<Object?> get props => [
        id,
        title,
        genreIds,
        backdropPath,
        overview,
        posterPath,
        voteAverage,
        releaseDate
      ];
}
