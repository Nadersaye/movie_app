import 'package:dartz/dartz.dart';
import 'package:movie_app/core/error/failure.dart';
import 'package:movie_app/movies/domain/entities/recommendation_movie.dart';
import 'package:movie_app/movies/domain/repository/base_movies_repository.dart';

import '../../../core/usecase/base_usecase.dart';

class GetRecommendationMoviesUsecase extends BaseUseCase<
    List<RecommendationsMovie>, RecommendationMoviesParameters> {
  final BaseMoviesRepository repository;

  GetRecommendationMoviesUsecase({required this.repository});

  @override
  Future<Either<Failure, List<RecommendationsMovie>>> call(
      RecommendationMoviesParameters paremater) async {
    return await repository.getRecommendationMovies(paremater);
  }
}

class RecommendationMoviesParameters {
  final int movieId;

  const RecommendationMoviesParameters({required this.movieId});
}
