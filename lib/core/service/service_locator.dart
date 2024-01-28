import 'package:get_it/get_it.dart';
import 'package:movie_app/movies/domain/repository/base_movies_repository.dart';
import 'package:movie_app/movies/domain/usecases/get_movie_details_usecase.dart';
import 'package:movie_app/movies/domain/usecases/get_now_playing_movies_usecase.dart';
import 'package:movie_app/movies/domain/usecases/get_recommendation_movies_usecase.dart';
import 'package:movie_app/movies/domain/usecases/get_top_rated_movies_usecase.dart';
import 'package:movie_app/movies/presentation/controller/movie_details/movie_details_bloc.dart';
import '../../movies/data/datasource/movie_remote_data_source.dart';
import '../../movies/data/repository/movies_repository.dart';
import '../../movies/domain/usecases/get_popular_movies_usecase.dart';
import '../../movies/presentation/controller/movie_bloc/movie_bloc.dart';

final sl = GetIt.instance;

class ServiceLocator {
  static void init() {
    sl.registerFactory(() => MovieBloc(sl(), sl(), sl()));
    sl.registerFactory(() => MovieDetailsBloc(sl(), sl()));

    sl.registerLazySingleton(
        () => GetNowPlayingMoviesUsecase(repository: sl()));
    sl.registerLazySingleton(() => GetPopularMoviesUsecase(repository: sl()));
    sl.registerLazySingleton(() => GetTopRatedMoviesUsecase(repository: sl()));
    sl.registerLazySingleton(() => GetMovieDetailsUseCase(repository: sl()));
    sl.registerLazySingleton(
        () => GetRecommendationMoviesUsecase(repository: sl()));
    sl.registerLazySingleton<BaseMoviesRemoteDataSource>(
        () => MovieRemoteDataSource());

    sl.registerLazySingleton<BaseMoviesRepository>(
        () => MoviesRepository(baseMoviesRemoteDataSource: sl()));
  }
}
