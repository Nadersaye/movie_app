// i want to make this class immutable, so i use final keyword
class Movie {
  final int id;
  final String title;
  final List<int> genreIds;
  final String backdropPath;
  final String overview;
  final String posterPath;
  final double voteAverage;

  Movie(
      {required this.id,
      required this.title,
      required this.genreIds,
      required this.backdropPath,
      required this.overview,
      required this.posterPath,
      required this.voteAverage});
}
