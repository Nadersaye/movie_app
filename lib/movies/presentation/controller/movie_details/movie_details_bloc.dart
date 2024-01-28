import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
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
    on<GetMovieRecommendationEvent>((event, emit) {});
  }

  FutureOr<void> _getMovieDetails(GetMovieDetailsEvent event, Emitter<MoviesDetailsState> emit) async{
    {
      final responce = getMovieDetailsUseCase(event.);
    }
  }
}
