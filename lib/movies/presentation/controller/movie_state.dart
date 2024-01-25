import 'package:equatable/equatable.dart';
import 'package:movie_app/core/utils/request_state_enum.dart';

import '../../domain/entities/movie.dart';

//Movie states class
abstract class MovieState extends Equatable {
  final List<Movie> nowPlayingMovies;
  final RequestState requestState;
  final String errorMessage;
  //final List<Movie> popularMovies;
  //final List<Movie> topRatedMovies;

  const MovieState(
      {this.nowPlayingMovies = const [],
      this.requestState = RequestState.loading,
      this.errorMessage = ''});

  @override
  List<Object> get props => [nowPlayingMovies, requestState, errorMessage];
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
