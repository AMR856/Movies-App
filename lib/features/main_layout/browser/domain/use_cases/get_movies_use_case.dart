import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/core/errors/failure.dart';
import 'package:movies_app/features/main_layout/browser/domain/repositories/movies_repositories.dart';
import 'package:movies_app/features/main_layout/home/domain/entities/movies_entity.dart';

@lazySingleton
class GetMoviesUseCase {
  MoviesRepositories moviesRepositories;
  GetMoviesUseCase({
    required this.moviesRepositories,
  });
  Future<Either<Failure, List<MoviesEntity>>> getMoviesByGenre(String? genre) async {
    return await moviesRepositories.getMoviesByGenre(genre);
  }
}
