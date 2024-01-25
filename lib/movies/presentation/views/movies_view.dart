import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:movie_app/movies/data/repository/movies_repository.dart';
import 'package:movie_app/movies/domain/repository/base_movies_repository.dart';
import 'package:movie_app/movies/domain/usecases/get_now_playing_movies_usecase.dart';
import 'package:movie_app/movies/data/datasource/movie_remote_data_source.dart';

class MoviesView extends StatefulWidget {
  const MoviesView({Key? key}) : super(key: key);

  @override
  State<MoviesView> createState() => _MoviesViewState();
}

class _MoviesViewState extends State<MoviesView> {
  void _getData() async {
    final BaseMoviesRemoteDataSource baseMoviesRemoteDataSource =
        MovieRemoteDataSource();
    final BaseMoviesRepository repository = MoviesRepository(
        baseMoviesRemoteDataSource: baseMoviesRemoteDataSource);
    final result =
        await GetNowPlayingMoviesUsecase(repository: repository).execute();
    result.fold((failure) => log(failure.errorMessage), (movies) {
      print(movies);
      //return log(movies.first.title);
    } // Replace with logging framework,
        );
  }

  @override
  void initState() {
    _getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
