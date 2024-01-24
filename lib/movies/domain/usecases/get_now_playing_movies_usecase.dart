import '../entities/movie.dart';
import '../repository/base_movies_repository.dart';

abstract class GetNowPlayingMoviesUsecase {
  final BaseMoviesRepository repository;

  GetNowPlayingMoviesUsecase({required this.repository});

  Future<List<Movie>> execute() async {
    return await repository.getNowPlayingMovies();
  }
}
