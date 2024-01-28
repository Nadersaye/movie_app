import 'package:dartz/dartz.dart';
import '../../../core/error/failure.dart';
import '../../../core/usecase/base_usecase.dart';
import '../entities/movie.dart';
import '../repository/base_movies_repository.dart';

class GetTopRatedMoviesUsecase extends BaseUseCase<List<Movie>, NoParameters> {
  final BaseMoviesRepository repository;

  GetTopRatedMoviesUsecase({required this.repository});
  @override
  Future<Either<Failure, List<Movie>>> call(NoParameters paremater) async {
    return await repository.getTopRatedMovies();
  }
}
