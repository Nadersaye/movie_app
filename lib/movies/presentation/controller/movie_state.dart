import 'package:equatable/equatable.dart';
import 'package:movie_app/core/utils/request_state_enum.dart';

import '../../domain/entities/movie.dart';

//Movie states class
class MoviesState extends Equatable {
  final List<Movie> nowPlayingMovies;
  final RequestState nowPlayingMoviesState;
  final String nowPlayingMoviesErrorMessage;

  const MoviesState({
    this.nowPlayingMovies = const [],
    this.nowPlayingMoviesState = RequestState.loading,
    this.nowPlayingMoviesErrorMessage = '',
  });

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
