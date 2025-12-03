import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/core/errors/app_exception.dart';
import 'package:movies_app/core/errors/failure.dart';
import 'package:movies_app/features/main_layout/home/data/data_source/remote/movies_remote_data_source.dart';
import 'package:movies_app/features/main_layout/home/domain/entities/movies_entity.dart';
import 'package:movies_app/features/main_layout/home/domain/repositories/movies_repositories.dart';


@LazySingleton(as: MoviesRepositories)
class MoviesRepositoriesImpl implements MoviesRepositories {
  MoviesRemoteDataSource moviesApiRemoteDataSource;
  MoviesRepositoriesImpl({
    required this.moviesApiRemoteDataSource,
  });

  @override
  Future<Either<Failure, List<MoviesEntity>>> getMovies() async {
    try {
      final response = await moviesApiRemoteDataSource.getMovies();
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
  
  @override
  Future<Either<Failure, List<MoviesEntity>>> getMoviesGenres(String? genre)async {
    try {
      final response = await moviesApiRemoteDataSource.getMoviesGenres(genre);
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
