import 'package:dartz/dartz.dart';
import 'package:movies_app/core/errors/failure.dart';
import 'package:movies_app/feature/main_layout/home/domain/entities/movies_entity.dart';

abstract class MoviesRepositories {
  Future<Either<Failure, List<MoviesEntity>>> getMovies();
  Future<Either<Failure, List<MoviesEntity>>> getMoviesGenres(String? genre);
}
