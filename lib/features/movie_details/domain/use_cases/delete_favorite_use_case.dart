import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/core/errors/failure.dart';
import 'package:movies_app/features/movie_details/data/models/delete_favorite_response.dart';
import 'package:movies_app/features/movie_details/domain/repos/details_repos.dart';

@injectable
class DeleteFavoriteUseCase {
  final DetailsRepos repos;

  DeleteFavoriteUseCase(this.repos);

  Future<Either<Failure, DeleteFavoriteResponse>> call(String movieId) async {
    return await repos.deleteFavorite(movieId);
  }
}