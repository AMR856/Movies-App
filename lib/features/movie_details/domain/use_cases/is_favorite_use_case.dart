import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/core/errors/failure.dart';
import 'package:movies_app/features/movie_details/domain/entities/is_favorite_entity.dart';
import 'package:movies_app/features/movie_details/domain/repos/details_repos.dart';

@injectable
class GetIsFavoriteUseCase {
  final DetailsRepos repos;

  GetIsFavoriteUseCase(this.repos);

  Future<Either<Failure, IsFavoriteEntity>> call(String movieId) async {
    return await repos.getIsFavorite(movieId);
  }
}