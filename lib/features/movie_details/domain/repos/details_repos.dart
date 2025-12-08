import 'package:dartz/dartz.dart';
import 'package:movies_app/core/errors/failure.dart';
import 'package:movies_app/features/movie_details/data/models/add_favorite_request.dart';
import 'package:movies_app/features/movie_details/data/models/delete_favorite_response.dart';
import 'package:movies_app/features/movie_details/domain/entities/add_favorite_entity.dart';
import 'package:movies_app/features/movie_details/domain/entities/details_entity.dart';
import 'package:movies_app/features/movie_details/domain/entities/is_favorite_entity.dart';
import 'package:movies_app/features/movie_details/domain/entities/movie_suggestion_entity.dart';

abstract class DetailsRepos {
  Future<Either<Failure, DetailsEntity>> getDetailsMovie(int? movieId);
  Future<Either<Failure, List<MovieSuggestionEntity>>> getMovieSuggestions(int? movieId);
  Future<Either<Failure, AddFavoriteEntity>> addFavorite(AddFavoriteRequest request);
  Future<Either<Failure, IsFavoriteEntity>> getIsFavorite(String movieId);
  Future<Either<Failure, DeleteFavoriteResponse>> deleteFavorite(String movieId);
}
