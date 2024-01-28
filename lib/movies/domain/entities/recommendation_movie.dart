import 'package:equatable/equatable.dart';

class RecommendationsMovie extends Equatable {
  final int id;
  final String? backdropPath;

  const RecommendationsMovie({required this.id, required this.backdropPath});

  @override
  List<Object?> get props => [id, backdropPath];
}
