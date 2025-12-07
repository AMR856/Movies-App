import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/core/errors/app_exception.dart';
import 'package:movies_app/core/errors/failure.dart';
import 'package:movies_app/features/update_profile/data/data_source/remote/update_profile_remote_data_source.dart';
import 'package:movies_app/features/update_profile/domain/entities/delete_profile_entity.dart';
import 'package:movies_app/features/update_profile/domain/entities/update_profile_entity.dart';
import 'package:movies_app/features/update_profile/domain/repositories/update_profile_repository.dart';
import 'package:movies_app/features/update_profile/data/models/update_profile_request.dart';

@LazySingleton(as: UpdateProfileRepository)
class UpdateProfileRepositoryImpl implements UpdateProfileRepository {
  final UpdateProfileRemoteDataSource remoteDataSource;

  UpdateProfileRepositoryImpl({
    required this.remoteDataSource,
  });

  @override
  Future<Either<Failure, UpdateProfileEntity>> updateProfile(
      UpdateProfileRequest request,
      ) async {
    try {

      final response = await remoteDataSource.updateProfile(
        UpdateProfileRequest(
          email: request.email,
          avatarId: request.avatarId,
          name: request.name,
          phone: request.phone,
        ),
      );

      return Right(response.toUpdateProfileEntity());
    } on RemoteException catch (exception) {
      return Left(Failure(message: exception.message));
    }
  }

  @override
  Future<Either<Failure, DeleteProfileEntity>> deleteProfile() async {
    try {
      final response = await remoteDataSource.deleteProfile();
      return Right(response.toDeleteProfileEntity());
    } on RemoteException catch (exception) {
      return Left(Failure(message: exception.message));
    }
  }
}
