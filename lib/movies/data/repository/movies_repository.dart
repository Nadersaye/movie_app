import 'package:dartz/dartz.dart';
import 'package:movie_app/core/error/exception.dart';
import 'package:movie_app/core/error/failure.dart';
import 'package:movie_app/movies/data/datasource/movie_remote_data_source.dart';
import 'package:movie_app/movies/data/models/movie_details_model.dart';
import 'package:movie_app/movies/data/models/recommendation_movie_model.dart';
import 'package:movie_app/movies/domain/entities/movie.dart';
import 'package:movie_app/movies/domain/repository/base_movies_repository.dart';
import '../../domain/usecases/get_movie_details_usecase.dart';
import '../../domain/usecases/get_recommendation_movies_usecase.dart';

class MoviesRepository implements BaseMoviesRepository {
  final BaseMoviesRemoteDataSource baseMoviesRemoteDataSource;

  MoviesRepository({required this.baseMoviesRemoteDataSource});
  @override
  Future<Either<Failure, List<Movie>>> getNowPlayingMovies() async {
    try {
      final responce = await baseMoviesRemoteDataSource.getNowPlayingMovies();
      return Right(responce);
    } on ServerException catch (failure) {
      return left(
          ServerFailure(errorMessage: failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getPopularMovies() async {
    try {
      final responce = await baseMoviesRemoteDataSource.getPopularMovies();
      return Right(responce);
    } on ServerException catch (failure) {
      return left(
          ServerFailure(errorMessage: failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getTopRatedMovies() async {
    try {
      final responce = await baseMoviesRemoteDataSource.getTopRatedMovies();
      return Right(responce);
    } on ServerException catch (failure) {
      throw ServerFailure(
          errorMessage: failure.errorMessageModel.statusMessage);
    }
  }

  @override
  Future<Either<Failure, MovieDetailsModel>> getMovieDetails(
      MovieDetailsParameters parameters) async {
    try {
      final responce =
          await baseMoviesRemoteDataSource.getMovieDetails(parameters);
      return Right(responce);
    } on ServerException catch (failure) {
      throw ServerFailure(
          errorMessage: failure.errorMessageModel.statusMessage);
    }
  }

  @override
  Future<Either<Failure, List<RecommnedationMovieModel>>>
      getRecommendationMovies(RecommendationMoviesParameters parameters) async {
    try {
      final responce =
          await baseMoviesRemoteDataSource.getRecommendationMovies(parameters);
      return right(responce);
    } on ServerException catch (failure) {
      throw ServerFailure(
          errorMessage: failure.errorMessageModel.statusMessage);
    }
  }
}
