class AppConstants {}

abstract class ApiConstant {
  static const String baseURL = "https://yts.lt/api/v2/";
  static const String routeBaseURL = 'https://route-movie-apis.vercel.app/';
  static const String listMoviesEndPoint = "list_movies.json";
  static const String movieDetailsEndPoint = "movie_details.json";
  static const String movieSuggestionsEndPoint = "movie_suggestions.json";
  static const String profileEndpoint = 'profile';
  static const String favoritesAllEndpoint = '/favorites/all';
  static const String updateProfileEndpoint = 'profile';
  static const String deleteProfileEndpoint = 'profile';
}

abstract class CacheConstant {
  static const String token = "";
}
// {
// "movieId": "72893",
// "name": "The Family McMullen",
// "rating": 6.8,
// "imageURL": "https://yts.lt/assets/images/movies/the_family_mcmullen_2025/large-cover.jpg",
// "year": "2025"
// }