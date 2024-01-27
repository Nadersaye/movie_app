import 'package:equatable/equatable.dart';
import 'package:movie_app/core/utils/request_state_enum.dart';

import '../../domain/entities/movie.dart';

//Movie states class
class MoviesState extends Equatable {
  final List<Movie> nowPlayingMovies;
  final RequestState nowPlayingMoviesState;
  final String nowPlayingMoviesErrorMessage;
  final List<Movie> popularMovies;
  final RequestState popularMoviesState;
  final String popularMoviesErrorMessage;
  final List<Movie> topRatedMovies;
  final RequestState topRatedMoviesState;
  final String topRatedMoviesErrorMessage;

  const MoviesState({
    this.nowPlayingMovies = const [],
    this.nowPlayingMoviesState = RequestState.loading,
    this.nowPlayingMoviesErrorMessage = '',
    this.popularMovies = const [],
    this.popularMoviesState = RequestState.loading,
    this.popularMoviesErrorMessage = '',
    this.topRatedMovies = const [],
    this.topRatedMoviesState = RequestState.loading,
    this.topRatedMoviesErrorMessage = '',
  });

  MoviesState copyWith({
    List<Movie>? nowPlayingMovies,
    RequestState? nowPlayingMoviesState,
    String? nowPlayingMoviesErrorMessage,
    List<Movie>? popularMovies,
    RequestState? popularMoviesState,
    String? popularMoviesErrorMessage,
    List<Movie>? topRatedMovies,
    RequestState? topRatedMoviesState,
    String? topRatedMoviesErrorMessage,
  }) {
    return MoviesState(
      nowPlayingMovies: nowPlayingMovies ?? this.nowPlayingMovies,
      nowPlayingMoviesState:
          nowPlayingMoviesState ?? this.nowPlayingMoviesState,
      nowPlayingMoviesErrorMessage:
          nowPlayingMoviesErrorMessage ?? this.nowPlayingMoviesErrorMessage,
      popularMovies: popularMovies ?? this.popularMovies,
      popularMoviesState: popularMoviesState ?? this.popularMoviesState,
      popularMoviesErrorMessage:
          popularMoviesErrorMessage ?? this.popularMoviesErrorMessage,
      topRatedMovies: topRatedMovies ?? this.topRatedMovies,
      topRatedMoviesState: topRatedMoviesState ?? this.topRatedMoviesState,
      topRatedMoviesErrorMessage:
          topRatedMoviesErrorMessage ?? this.topRatedMoviesErrorMessage,
    );
  }

  @override
  List<Object> get props =>
      [nowPlayingMovies, nowPlayingMoviesState, nowPlayingMoviesErrorMessage];
}

//create a class for each state
/*class MovieInitialState extends MovieState {}

class MovieLoadingState extends MovieState {}

class MovieLoadedState extends MovieState {
  final List<Movie> movies;

  const MovieLoadedState({required this.movies});
}

class MovieErrorState extends MovieState {
  final String message;

  const MovieErrorState({required this.message});
}*/
