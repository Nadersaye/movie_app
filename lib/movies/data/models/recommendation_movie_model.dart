import 'package:movie_app/movies/domain/entities/recommendation_movie.dart';

class RecommnedationMovieModel extends RecommendationsMovie {
  const RecommnedationMovieModel(
      {required super.id, required super.backdropPath});
  factory RecommnedationMovieModel.fromJson(Map<String, dynamic> json) =>
      RecommnedationMovieModel(
        id: json["id"],
        backdropPath: json["backdrop_path"],
      );
}
