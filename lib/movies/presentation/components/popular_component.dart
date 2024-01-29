import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/utils/request_state_enum.dart';
import 'package:movie_app/movies/presentation/controller/movie_bloc/movie_bloc.dart';
import 'package:shimmer/shimmer.dart';
import '../../../core/network/api_constances.dart';
import '../controller/movie_bloc/movie_state.dart';
import '../views/movie_detail_screen.dart';

class PopularComponent extends StatelessWidget {
  const PopularComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieBloc, MoviesState>(
      buildWhen: (previous, current) {
        return previous.popularMoviesState != current.popularMoviesState;
      },
      builder: (context, state) {
        switch (state.popularMoviesState) {
          case RequestState.loading:
            return const SizedBox(
                height: 400, child: Center(child: CircularProgressIndicator()));
          case RequestState.loaded:
            return FadeIn(
              duration: const Duration(milliseconds: 500),
              child: SizedBox(
                height: 170.0,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  itemCount: state.popularMovies.length,
                  itemBuilder: (context, index) {
                    final movie = state.popularMovies[index];
                    return Container(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: InkWell(
                        onTap: () {
                          // : NAVIGATE TO  MOVIE DETAILS
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) {
                              return MovieDetailScreen(id: movie.id);
                            },
                          ));
                        },
                        child: ClipRRect(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(8.0)),
                          child: CachedNetworkImage(
                            width: 120.0,
                            fit: BoxFit.cover,
                            imageUrl:
                                ApiConstance.imageBaseUrl(movie.backdropPath),
                            placeholder: (context, url) => Shimmer.fromColors(
                              baseColor: Colors.grey[850]!,
                              highlightColor: Colors.grey[800]!,
                              child: Container(
                                height: 170.0,
                                width: 120.0,
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              ),
                            ),
                            errorWidget: (context, url, error) =>
                                const Icon(Icons.error),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            );

          case RequestState.error:
            return const SizedBox(
              height: 400,
              child: Center(
                child: Text('Error'),
              ),
            );

          default:
            return const SizedBox(
              height: 400,
              child: Center(
                child: Text(''),
              ),
            );
        }
      },
    );
  }
}
