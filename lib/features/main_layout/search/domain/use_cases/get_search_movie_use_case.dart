import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/core/errors/failure.dart';
import 'package:movies_app/features/main_layout/home/domain/entities/movies_entity.dart';
import 'package:movies_app/features/main_layout/search/domain/repos/search_repos.dart';

@lazySingleton
class GetSearchMovieUseCase {
  SearchRepos searchRepos;
  GetSearchMovieUseCase({
    required this.searchRepos,
  });
  Future<Either<Failure, List<MoviesEntity>>> getSearchMovies(
    String? keySearch,
  ) async {
    return await searchRepos.getSearchMovie(keySearch);
  }
}
