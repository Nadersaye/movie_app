import '../entities/movie.dart';
import '../repository/base_movies_repository.dart';

abstract class GetTopRatedMoviesUsecase {
  final BaseMoviesRepository repository;

  GetTopRatedMoviesUsecase({required this.repository});

  Future<List<Movie>> execute() async {
    return await repository.getTopRatedMovies();
  }
}
