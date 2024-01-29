import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app/core/utils/request_state_enum.dart';
import 'package:movie_app/movies/domain/usecases/get_movie_details_usecase.dart';
import 'package:movie_app/movies/domain/usecases/get_recommendation_movies_usecase.dart';

import 'movie_details_state.dart';
part 'movie_details_event.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MoviesDetailsState> {
  final GetMovieDetailsUseCase getMovieDetailsUseCase;
  final GetRecommendationMoviesUsecase getRecommendationMoviesUsecase;
  MovieDetailsBloc(
      this.getMovieDetailsUseCase, this.getRecommendationMoviesUsecase)
      : super(const MoviesDetailsState()) {
    on<GetMovieDetailsEvent>(_getMovieDetails);
    on<GetMovieRecommendationEvent>(_getRecommendationMovies);
  }

  FutureOr<void> _getMovieDetails(
      GetMovieDetailsEvent event, Emitter<MoviesDetailsState> emit) async {
    {
      final responce = await getMovieDetailsUseCase(
          MovieDetailsParameters(movieId: event.movieId));
      responce.fold((failure) {
        emit(state.copyWith(
            movieDetailsState: RequestState.error,
            movieDetailsErrorMessage: failure.errorMessage));
      }, (movieDetails) {
        emit(state.copyWith(
            movieDetails: movieDetails,
            movieDetailsState: RequestState.loaded));
      });
    }
  }

  FutureOr<void> _getRecommendationMovies(GetMovieRecommendationEvent event,
      Emitter<MoviesDetailsState> emit) async {
    final responce = await getRecommendationMoviesUsecase(
        RecommendationMoviesParameters(movieId: event.movieId));
    responce.fold((failure) {
      emit(state.copyWith(
          recommendationsMoviesState: RequestState.error,
          recommendationsMoviesErrorMessage: failure.errorMessage));
    }, (recommendationMovies) {
      emit(state.copyWith(
          recommendationsMovies: recommendationMovies,
          recommendationsMoviesState: RequestState.loaded));
    });
  }
}
