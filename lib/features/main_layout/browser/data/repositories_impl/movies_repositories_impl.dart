
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/core/errors/failure.dart';
import 'package:movies_app/features/main_layout/browser/domain/repositories/movies_repositories.dart';
import 'package:movies_app/features/main_layout/browser/data/data_source/remote/movies_remote_data_source.dart';
import 'package:movies_app/core/errors/app_exception.dart';
import 'package:movies_app/features/main_layout/home/domain/entities/movies_entity.dart';

@LazySingleton(as: MoviesRepositories)
class MoviesRepositoriesImpl implements MoviesRepositories {
  MoviesRemoteDataSource moviesApiRemoteDataSource;
  MoviesRepositoriesImpl({
    required this.moviesApiRemoteDataSource,
  });

  @override
  Future<Either<Failure, List<MoviesEntity>>> getMoviesByGenre(
    String? genre,
  ) async {
    try {
      final response = await moviesApiRemoteDataSource.getMoviesByGenre(genre);
      return Right(
        response.data.movies
            .map(
              (movie) => movie.toMoviesEntity(),
            )
            .toList(),
      );
    } on RemoteException catch (exception) {
      return Left(Failure(message: exception.message));
    }
  }
}
