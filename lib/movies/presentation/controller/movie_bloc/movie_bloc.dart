import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/usecase/base_usecase.dart';
import 'package:movie_app/movies/domain/usecases/get_now_playing_movies_usecase.dart';
import 'package:movie_app/movies/presentation/controller/movie_bloc/movie_event.dart';
import 'package:movie_app/movies/presentation/controller/movie_bloc/movie_state.dart';
import '../../../../core/utils/request_state_enum.dart';
import '../../../domain/usecases/get_popular_movies_usecase.dart';
import '../../../domain/usecases/get_top_rated_movies_usecase.dart';

class MovieBloc extends Bloc<MovieEvent, MoviesState> {
  final GetNowPlayingMoviesUsecase getNowPlayingMoviesUsecase;
  final GetPopularMoviesUsecase getPopularMoviesUsecase;
  final GetTopRatedMoviesUsecase getTopRatedMoviesUsecase;
  MovieBloc(this.getNowPlayingMoviesUsecase, this.getPopularMoviesUsecase,
      this.getTopRatedMoviesUsecase)
      : super(const MoviesState()) {
    on<GetNowPlayingMoviesEvent>(_getNowPlayingMovies);

    on<GetPopularMoviesEvent>(_getPopularMovies);

    on<GetTopRatedMoviesEvent>(_getTopRatedMovies);
  }

  FutureOr<void> _getNowPlayingMovies(
      GetNowPlayingMoviesEvent event, Emitter<MoviesState> emit) async {
    final resualt = await getNowPlayingMoviesUsecase(NoParameters());
    resualt.fold((l) {
      emit(state.copyWith(
          nowPlayingMoviesState: RequestState.error,
          nowPlayingMoviesErrorMessage: l.errorMessage));
    }, (r) {
      emit(state.copyWith(
          nowPlayingMovies: r, nowPlayingMoviesState: RequestState.loaded));
    });
  }

  FutureOr<void> _getPopularMovies(
      GetPopularMoviesEvent event, Emitter<MoviesState> emit) async {
    final resualt = await getPopularMoviesUsecase(NoParameters());
    resualt.fold((l) {
      emit(state.copyWith(
          popularMoviesState: RequestState.error,
          popularMoviesErrorMessage: l.errorMessage));
    }, (r) {
      emit(state.copyWith(
          popularMovies: r, popularMoviesState: RequestState.loaded));
    });
  }

  FutureOr<void> _getTopRatedMovies(
      GetTopRatedMoviesEvent event, Emitter<MoviesState> emit) async {
    final resualt = await getTopRatedMoviesUsecase(NoParameters());
    resualt.fold((l) {
      emit(state.copyWith(
          topRatedMoviesState: RequestState.error,
          topRatedMoviesErrorMessage: l.errorMessage));
    }, (r) {
      emit(state.copyWith(
          topRatedMovies: r, topRatedMoviesState: RequestState.loaded));
    });
  }
}
