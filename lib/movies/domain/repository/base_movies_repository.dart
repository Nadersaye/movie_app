import 'package:dartz/dartz.dart';
import 'package:movie_app/movies/domain/entities/movie_details.dart';
import 'package:movie_app/movies/domain/entities/recommendation_movie.dart';
import 'package:movie_app/movies/domain/usecases/get_movie_details_usecase.dart';
import '../../../core/error/failure.dart';
import '../entities/movie.dart';
import '../usecases/get_recommendation_movies_usecase.dart';

abstract class BaseMoviesRepository {
  Future<Either<Failure, List<Movie>>> getNowPlayingMovies();
  Future<Either<Failure, List<Movie>>> getPopularMovies();
  Future<Either<Failure, List<Movie>>> getTopRatedMovies();
  Future<Either<Failure, MovieDetails>> getMovieDetails(
      MovieDetailsParameters parameters);
  Future<Either<Failure, List<RecommendationsMovie>>> getRecommendationMovies(
      RecommendationMoviesParameters parameters);
}
