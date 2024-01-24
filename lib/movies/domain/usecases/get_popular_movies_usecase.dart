import '../entities/movie.dart';
import '../repository/base_movies_repository.dart';

abstract class GetPopularMoviesUsecase {
  final BaseMoviesRepository repository;

  GetPopularMoviesUsecase({required this.repository});

  Future<List<Movie>> execute() async {
    return await repository.getPopularMovies();
  }
}
