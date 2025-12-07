import 'package:dartz/dartz.dart';
import 'package:movies_app/core/errors/failure.dart';
import 'package:movies_app/features/update_profile/data/models/update_profile_request.dart';
import 'package:movies_app/features/update_profile/domain/entities/delete_profile_entity.dart';
import 'package:movies_app/features/update_profile/domain/entities/update_profile_entity.dart';

abstract class UpdateProfileRepository {
  Future<Either<Failure, UpdateProfileEntity>> updateProfile(
    UpdateProfileRequest request,
  );
  Future<Either<Failure, DeleteProfileEntity>> deleteProfile();
}
