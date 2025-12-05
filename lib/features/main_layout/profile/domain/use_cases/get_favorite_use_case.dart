import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/core/errors/failure.dart';
import 'package:movies_app/features/main_layout/profile/domain/entites/favorite_entity.dart';
import 'package:movies_app/features/main_layout/profile/domain/repositories/get_profile_repository.dart';

@lazySingleton
class GetFavoritesUseCase {
  final ProfileRepository repository;

  GetFavoritesUseCase({required this.repository});

  Future<Either<Failure, List<FavoriteEntity>>> call() async {
    return await repository.getFavorites();
  }
}