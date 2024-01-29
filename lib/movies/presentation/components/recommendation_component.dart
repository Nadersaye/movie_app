import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/utils/request_state_enum.dart';
import 'package:movie_app/movies/presentation/controller/movie_details/movie_details_state.dart';
import 'package:shimmer/shimmer.dart';
import '../../../core/network/api_constances.dart';
import '../../../core/utils/dummy.dart';
import '../../domain/entities/recommendation_movie.dart';
import '../controller/movie_details/movie_details_bloc.dart';

class RecommendationComponent extends StatelessWidget {
  const RecommendationComponent({super.key, required this.recommendations});
  final List<RecommendationsMovie> recommendations;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieDetailsBloc, MoviesDetailsState>(
      builder: (context, state) {
        switch (state.recommendationsMoviesState) {
          case RequestState.loading:
            return const SliverToBoxAdapter(
              child: SizedBox(
                height: 400,
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            );
          case RequestState.loaded:
            return SliverPadding(
              padding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 24.0),
              sliver: _showRecommendations(),
            );
          default:
            return const SliverToBoxAdapter(
              child: Center(
                child: Text('Error'),
              ),
            );
        }
      },
    );
  }

  Widget _showRecommendations() {
    return SliverGrid(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          final recommendation = recommendations[index];
          return FadeInUp(
            from: 20,
            duration: const Duration(milliseconds: 500),
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(4.0)),
              child: CachedNetworkImage(
                imageUrl: ApiConstance.imageBaseUrl(recommendation
                        .backdropPath ??
                    'https://www.shutterstock.com/image-vector/error-500-page-empty-symbol-260nw-1711106146.jpg'),
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
                errorWidget: (context, url, error) => const Icon(Icons.error),
                height: 180.0,
                fit: BoxFit.cover,
              ),
            ),
          );
        },
        childCount: recommendationDummy.length,
      ),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        mainAxisSpacing: 8.0,
        crossAxisSpacing: 8.0,
        childAspectRatio: 0.7,
        crossAxisCount: 3,
      ),
    );
  }
}
