import 'package:dartz/dartz.dart';
import 'package:movies_app/core/errors/failure.dart';
import 'package:movies_app/features/main_layout/profile/domain/entites/favorite_entity.dart';
import 'package:movies_app/features/main_layout/profile/domain/entites/profile_entity.dart';

abstract class ProfileRepository {
  Future<Either<Failure, ProfileEntity>> getProfile();
  Future<Either<Failure, List<FavoriteEntity>>> getFavorites();
}