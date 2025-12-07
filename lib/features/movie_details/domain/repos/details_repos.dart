import 'package:dartz/dartz.dart';
import 'package:movies_app/core/errors/failure.dart';
import 'package:movies_app/features/movie_details/domain/entities/details_entity.dart';
import 'package:movies_app/features/movie_details/domain/entities/movie_suggestion_entity.dart';

abstract class DetailsRepos {
  Future<Either<Failure, DetailsEntity>> getDetailsMovie(int? movieId);
  Future<Either<Failure, List<MovieSuggestionEntity>>> getMovieSuggestions(int? movieId);
}
