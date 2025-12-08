import 'package:movies_app/features/movie_details/data/models/Is_movie_favorite_response.dart';
import 'package:movies_app/features/movie_details/data/models/add_favorite_request.dart';
import 'package:movies_app/features/movie_details/data/models/delete_favorite_response.dart';
import 'package:movies_app/features/movie_details/data/models/details_response.dart';
import 'package:movies_app/features/movie_details/data/models/movie_suggestions_response.dart';
import 'package:movies_app/features/movie_details/data/models/add_favorite_response.dart';

abstract class DetailsRemoteDataSource {
  Future<DetailsResponse> getDetailsMovie(int? movieId);
  Future<MovieSuggestionsResponse> getMovieSuggestions(int? movieId);
  Future<AddFavoriteResponse> addToFavorites(AddFavoriteRequest request);
  Future<IsMovieFavoriteResponse> isFavorite(String movieId);
  Future<DeleteFavoriteResponse> deleteFavorite(String movieId);
}
