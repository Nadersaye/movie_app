import 'package:dartz/dartz.dart';
import '../../../core/error/failure.dart';
import '../entities/movie.dart';
import '../repository/base_movies_repository.dart';

abstract class GetTopRatedMoviesUsecase {
  final BaseMoviesRepository repository;

  GetTopRatedMoviesUsecase({required this.repository});

  Future<Either<Failure, List<Movie>>> execute() async {
    return await repository.getTopRatedMovies();
  }
}
