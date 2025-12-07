import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/core/errors/app_exception.dart';
import 'package:movies_app/core/errors/failure.dart';
import 'package:movies_app/features/main_layout/home/domain/entities/movies_entity.dart';
import 'package:movies_app/features/main_layout/search/data/data_source/remote/search_remote_data_source.dart';
import 'package:movies_app/features/main_layout/search/domain/repos/search_repos.dart';
@LazySingleton(as: SearchRepos)
class SearchRepoImpl implements SearchRepos {
  SearchRemoteDataSource searchRemoteDataSource;
  SearchRepoImpl({
    required this.searchRemoteDataSource,
  });
  @override
  Future<Either<Failure, List<MoviesEntity>>> getSearchMovie(
    String? keySearch,
  ) async {
    try {
      final response = await searchRemoteDataSource.getSearchMovie(keySearch);
      return Right(
        response.data.movies
            .map(
              (e) => e.toMoviesEntity(),
            )
            .toList(),
      );
    } on RemoteException catch (exception) {
      return Left(Failure(message: exception.message));
    }
  }
}
