import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/core/errors/failure.dart';
import 'package:movies_app/feature/main_layout/home/domain/entities/movies_entity.dart';
import 'package:movies_app/feature/main_layout/home/domain/repositories/movies_repositories.dart';
@lazySingleton
class GetMoviesUseCase {
  MoviesRepositories moviesRepositories;
  GetMoviesUseCase({
    required this.moviesRepositories,
  });
  Future<Either<Failure, List<MoviesEntity>>> getMovies() async {
    return await moviesRepositories.getMovies();
  }
  Future<Either<Failure, List<MoviesEntity>>> getMoviesGenres(String? genre) async {
    return await moviesRepositories.getMoviesGenres(genre);
  }
}
