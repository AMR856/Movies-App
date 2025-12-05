import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/core/errors/app_exception.dart';
import 'package:movies_app/core/errors/failure.dart';
import 'package:movies_app/features/movie_details/data/data_source/remote/details_remote_data_source.dart';
import 'package:movies_app/features/movie_details/domain/entities/details_entity.dart';
import 'package:movies_app/features/movie_details/domain/entities/movie_suggestion_entity.dart';
import 'package:movies_app/features/movie_details/domain/repos/details_repos.dart';

@LazySingleton(as: DetailsRepos)
class DetailsRepoImpl implements DetailsRepos {
  DetailsRemoteDataSource detailsApiRemoteDataSource;
  DetailsRepoImpl({
    required this.detailsApiRemoteDataSource,
  });
  @override
  Future<Either<Failure, DetailsEntity>> getDetailsMovie(int? movieId) async {
    try {
      final response = await detailsApiRemoteDataSource.getDetailsMovie(
        movieId,
      );
      return Right(response.data!.movie!.toDetailsEntity());
    } on RemoteException catch (exception) {
      return Left(Failure(message: exception.message));
    }
  }

  @override
  Future<Either<Failure, List<MovieSuggestionEntity>>> getMovieSuggestions(
    int? movieId,
  ) async {
    try {
      final response = await detailsApiRemoteDataSource.getMovieSuggestions(
        movieId,
      );
      return Right(
        response.data!.movies!
            .map(
              (e) => e.toMovieSuggestionEntity(),
            )
            .toList(),
      );
    } on RemoteException catch (exception) {
      return Left(Failure(message: exception.message));
    }
  }
}
