import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/core/errors/app_exception.dart';
import 'package:movies_app/core/errors/failure.dart';
import 'package:movies_app/features/movie_details/data/data_source/remote/details_remote_data_source.dart';
import 'package:movies_app/features/movie_details/data/models/add_favorite_request.dart';
import 'package:movies_app/features/movie_details/data/models/delete_favorite_response.dart';
import 'package:movies_app/features/movie_details/domain/entities/add_favorite_entity.dart';
import 'package:movies_app/features/movie_details/domain/entities/details_entity.dart';
import 'package:movies_app/features/movie_details/domain/entities/is_favorite_entity.dart';
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

  @override
  Future<Either<Failure, AddFavoriteEntity>> addFavorite(AddFavoriteRequest request) async {
    try {
      final response = await detailsApiRemoteDataSource.addToFavorites(request);
      return Right(AddFavoriteEntity(message: response.message ?? "Added successfully"));
    } on RemoteException catch (e) {
      return Left(Failure(message: e.message));
    }
  }

  @override
  Future<Either<Failure, IsFavoriteEntity>> getIsFavorite(String movieId) async {
    try {
      final response = await detailsApiRemoteDataSource.isFavorite(movieId);
      return Right(IsFavoriteEntity(
        isFavorite: response.data ?? false,
        message: response.message ?? 'Fetched successfully',
      ));
    } on RemoteException catch (e) {
      return Left(Failure(message: e.message));
    }
  }
  @override
  Future<Either<Failure, DeleteFavoriteResponse>> deleteFavorite(String movieId) async {
    try {
      final response = await detailsApiRemoteDataSource.deleteFavorite(movieId);
      return Right(response);
    } on RemoteException catch (e) {
      return Left(Failure(message: e.message));
    }
  }
}
