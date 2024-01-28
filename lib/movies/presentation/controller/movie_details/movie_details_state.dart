import 'package:equatable/equatable.dart';

import 'package:movie_app/core/utils/request_state_enum.dart';
import 'package:movie_app/movies/domain/entities/movie_details.dart';
import 'package:movie_app/movies/domain/entities/recommendation_movie.dart';

//Movie states class
class MoviesDetailsState extends Equatable {
  final MovieDetails? movieDetails;
  final RequestState movieDetailsState;
  final String movieDetailsErrorMessage;
  final List<RecommendationsMovie> recommendationsMovies;
  final RequestState recommendationsMoviesState;
  final String recommendationsMoviesErrorMessage;

  const MoviesDetailsState({
    this.movieDetails,
    this.movieDetailsState = RequestState.loading,
    this.movieDetailsErrorMessage = '',
    this.recommendationsMovies = const [],
    this.recommendationsMoviesState = RequestState.loading,
    this.recommendationsMoviesErrorMessage = '',
  });

  MoviesDetailsState copyWith({
    MovieDetails? movieDetails,
    RequestState? movieDetailsState,
    String? movieDetailsErrorMessage,
    List<RecommendationsMovie>? recommendationsMovies,
    RequestState? recommendationsMoviesState,
    String? recommendationsMoviesErrorMessage,
  }) {
    return MoviesDetailsState(
      movieDetails: movieDetails ?? this.movieDetails,
      movieDetailsState: movieDetailsState ?? this.movieDetailsState,
      movieDetailsErrorMessage:
          movieDetailsErrorMessage ?? this.movieDetailsErrorMessage,
      recommendationsMovies:
          recommendationsMovies ?? this.recommendationsMovies,
      recommendationsMoviesState:
          recommendationsMoviesState ?? this.recommendationsMoviesState,
      recommendationsMoviesErrorMessage: recommendationsMoviesErrorMessage ??
          this.recommendationsMoviesErrorMessage,
    );
  }

  @override
  List<Object> get props => [
        movieDetailsState,
        movieDetailsErrorMessage,
        recommendationsMovies,
        recommendationsMoviesState,
        recommendationsMoviesErrorMessage,
      ];
}
/*sealed class MovieDetailsState extends Equatable {
  const MovieDetailsState();
  
  @override
  List<Object> get props => [];
}

final class MovieDetailsInitial extends MovieDetailsState {}
*/