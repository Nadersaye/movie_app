class ApiConstance {
  static const String baseUrl = "https://api.themoviedb.org/3/";
  static const String apiKey = "8d99e7a13f7817fa58a887e894adf899";
  static const String accessToken =
      "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI4ZDk5ZTdhMTNmNzgxN2ZhNThhODg3ZTg5NGFkZjg5OSIsInN1YiI6IjY1YWY5NzZhMzk3NTYxMDBhZmQwN2U1MCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.80rlzxZ69FQP8FVuhez0ngJoHwah4ujCBQNgbFL_pTg";
  static const String nowPlayingMoviesUrl = "${baseUrl}movie/now_playing";
  static const String popularMoviesUrl = "${baseUrl}movie/popular";
  static const String topRatedMoviesUrl = "${baseUrl}movie/top_rated";
  static String imageBaseUrl(String imagePath) =>
      "https://image.tmdb.org/t/p/w500$imagePath";
  static String movieDetailsUrl(int movieId) => "${baseUrl}movie/$movieId";
  static String movieRecommendationsUrl(int movieId) =>
      "${baseUrl}movie/$movieId/recommendations";
}
