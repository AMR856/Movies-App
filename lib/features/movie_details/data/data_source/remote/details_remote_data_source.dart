import 'package:movies_app/features/movie_details/data/models/details_response.dart';
import 'package:movies_app/features/movie_details/data/models/movie_suggestions_response.dart';

abstract class DetailsRemoteDataSource {
  Future<DetailsResponse> getDetailsMovie(int? movieId);
  Future<MovieSuggestionsResponse> getMovieSuggestions(int? movieId);
}
