import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/core/errors/failure.dart';
import 'package:movies_app/features/movie_details/domain/entities/details_entity.dart';
import 'package:movies_app/features/movie_details/domain/entities/movie_suggestion_entity.dart';
import 'package:movies_app/features/movie_details/domain/repos/details_repos.dart';
@lazySingleton
class GetDetailsMovieUseCase {
  DetailsRepos detailsRepos;
  GetDetailsMovieUseCase({
    required this.detailsRepos,
  });
  Future<Either<Failure, DetailsEntity>> getDetailsMovie(int? movieId) async {
    return detailsRepos.getDetailsMovie(movieId);
  }
   Future<Either<Failure, List<MovieSuggestionEntity>>> getMovieSuggestions(int? movieId) async {
    return await detailsRepos.getMovieSuggestions(movieId);
  }
}
