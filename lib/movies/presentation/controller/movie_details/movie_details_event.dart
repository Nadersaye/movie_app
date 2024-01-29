part of 'movie_details_bloc.dart';

sealed class MovieDetailsEvent extends Equatable {
  const MovieDetailsEvent();

  @override
  List<Object> get props => [];
}

class GetMovieDetailsEvent extends MovieDetailsEvent {
  final int movieId;

  const GetMovieDetailsEvent(this.movieId);

  @override
  List<Object> get props => [movieId];
}

class GetMovieRecommendationEvent extends MovieDetailsEvent {
  final int movieId;

  const GetMovieRecommendationEvent(this.movieId);

  @override
  List<Object> get props => [movieId];
}
