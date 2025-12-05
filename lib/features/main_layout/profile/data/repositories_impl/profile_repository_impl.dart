import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/core/errors/failure.dart';
import 'package:movies_app/core/errors/app_exception.dart';
import 'package:movies_app/features/main_layout/profile/domain/entites/favorite_entity.dart';
import 'package:movies_app/features/main_layout/profile/domain/entites/profile_entity.dart';
import 'package:movies_app/features/main_layout/profile/domain/repositories/get_profile_repository.dart';
import 'package:movies_app/features/main_layout/profile/data/remote/profile_remote_data_source.dart';

@LazySingleton(as: ProfileRepository)
class ProfileRepositoryImpl implements ProfileRepository {
  final ProfileRemoteDataSource remoteDataSource;

  ProfileRepositoryImpl({
    required this.remoteDataSource,
  });

  @override
  Future<Either<Failure, ProfileEntity>> getProfile() async {
    try {
      final response = await remoteDataSource.getProfile();
      return Right(response.data.toProfileEntity());
    } on RemoteException catch (exception) {
      return Left(Failure(message: exception.message));
    } catch (exception) {
      return Left(Failure(message: 'Unexpected error'));
    }
  }

  @override
  Future<Either<Failure, List<FavoriteEntity>>> getFavorites() async {
    try {
      final response = await remoteDataSource.getFavorites();
      return Right(
        response.data
            !.map((f) => f.toFavoriteEntity())
            .toList(),
      );
    } on RemoteException catch (e) {
      return Left(Failure(message: e.message));
    }
  }
}
