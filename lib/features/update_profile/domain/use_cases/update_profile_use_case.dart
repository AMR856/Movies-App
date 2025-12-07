import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/core/errors/failure.dart';
import 'package:movies_app/features/update_profile/data/models/update_profile_request.dart';
import 'package:movies_app/features/update_profile/domain/entities/update_profile_entity.dart';
import 'package:movies_app/features/update_profile/domain/repositories/update_profile_repository.dart';

@lazySingleton
class UpdateProfileUseCase {
  final UpdateProfileRepository repository;

  UpdateProfileUseCase(this.repository);

  Future<Either<Failure, UpdateProfileEntity>> call(
      UpdateProfileRequest request) async {
    return await repository.updateProfile(request);
  }
}
