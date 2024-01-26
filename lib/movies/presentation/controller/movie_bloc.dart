import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/movies/domain/usecases/get_now_playing_movies_usecase.dart';
import 'package:movie_app/movies/presentation/controller/movie_event.dart';
import 'package:movie_app/movies/presentation/controller/movie_state.dart';
import '../../../core/utils/request_state_enum.dart';

class MovieBloc extends Bloc<MovieEvent, MoviesState> {
  final GetNowPlayingMoviesUsecase getNowPlayingMoviesUsecase;
  MovieBloc(this.getNowPlayingMoviesUsecase) : super(const MoviesState()) {
    on<GetNowPlayingMoviesEvent>((event, emit) async {
      final resualt = await getNowPlayingMoviesUsecase.execute();
      resualt.fold((l) {
        emit(MoviesState(
            nowPlayingMoviesState: RequestState.error,
            nowPlayingMoviesErrorMessage: l.errorMessage));
      }, (r) {
        emit(MoviesState(
            nowPlayingMoviesState: RequestState.loaded, nowPlayingMovies: r));
      });
    });
  }
}
