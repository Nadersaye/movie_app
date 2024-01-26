import 'package:get_it/get_it.dart';
import 'package:movie_app/movies/domain/repository/base_movies_repository.dart';
import 'package:movie_app/movies/domain/usecases/get_now_playing_movies_usecase.dart';
import '../../movies/data/datasource/movie_remote_data_source.dart';
import '../../movies/data/repository/movies_repository.dart';
import '../../movies/presentation/controller/movie_bloc.dart';

final sl = GetIt.instance;

class ServiceLocator {
  static void init() {
    sl.registerFactory(() => MovieBloc(sl()));

    sl.registerLazySingleton(
        () => GetNowPlayingMoviesUsecase(repository: sl()));

    sl.registerLazySingleton<BaseMoviesRemoteDataSource>(
        () => MovieRemoteDataSource());

    sl.registerLazySingleton<BaseMoviesRepository>(
        () => MoviesRepository(baseMoviesRemoteDataSource: sl()));
  }
}
