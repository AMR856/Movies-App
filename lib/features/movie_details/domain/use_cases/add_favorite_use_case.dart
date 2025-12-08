import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/core/errors/failure.dart';
import 'package:movies_app/features/movie_details/data/models/add_favorite_request.dart';
import 'package:movies_app/features/movie_details/domain/entities/add_favorite_entity.dart';
import 'package:movies_app/features/movie_details/domain/repos/details_repos.dart';

@injectable
class AddFavoriteUseCase {
  final DetailsRepos repository;

  AddFavoriteUseCase(this.repository);

  Future<Either<Failure, AddFavoriteEntity>> call(AddFavoriteRequest request) async {
    return await repository.addFavorite(request);
  }
}