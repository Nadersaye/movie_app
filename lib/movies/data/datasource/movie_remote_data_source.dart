import 'package:dio/dio.dart';
import 'package:movie_app/core/error/exception.dart';
import 'package:movie_app/core/network/api_constances.dart';
import 'package:movie_app/movies/data/models/movie_model.dart';

import '../../../core/network/error_message_model.dart';

abstract class BaseMoviesRemoteDataSource {
  Future<List<MovieModel>> getNowPlayingMovies();
  Future<List<MovieModel>> getPopularMovies();
  Future<List<MovieModel>> getTopRatedMovies();
}

class MovieRemoteDataSource implements BaseMoviesRemoteDataSource {
  @override
  Future<List<MovieModel>> getNowPlayingMovies() async {
    final responce = await Dio().get(ApiConstance.nowPlayingMoviesUrl,
        options: Options(
            contentType: 'application/json',
            headers: {"Authorization": "Bearer ${ApiConstance.accessToken}"}));
    print('hkjh');
    if (responce.statusCode == 200) {
      /*
      return List<MovieModel>.from(
        (responce.data['results'] as List).map((e) => MovieModel.fromJson(e)));
       */
      final data = responce.data['results'] as List;
      return data.map((e) => MovieModel.fromJson(e)).toList();
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(responce.data));
    }
  }

  @override
  Future<List<MovieModel>> getPopularMovies() async {
    final responce = await Dio().get(ApiConstance.popularMoviesUrl,
        options: Options(
            contentType: 'application/json',
            headers: {"Authorization": "Bearer ${ApiConstance.accessToken}"}));
    if (responce.statusCode == 200) {
      return List<MovieModel>.from((responce.data['results'] as List)
          .map((e) => MovieModel.fromJson(e)));
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(responce.data));
    }
  }

  @override
  Future<List<MovieModel>> getTopRatedMovies() async {
    final responce = await Dio().get(ApiConstance.topRatedMoviesUrl,
        options: Options(
            contentType: 'application/json',
            headers: {"Authorization": "Bearer ${ApiConstance.accessToken}"}));
    if (responce.statusCode == 200) {
      final data = responce.data['resualts'] as List;
      return data.map((e) => MovieModel.fromJson(e)).toList();
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(responce.data));
    }
  }
}
