import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/core/errors/failure.dart';
import 'package:movies_app/features/update_profile/domain/entities/delete_profile_entity.dart';
import 'package:movies_app/features/update_profile/domain/repositories/update_profile_repository.dart';

@lazySingleton
class DeleteProfileUseCase {
  final UpdateProfileRepository repository;

  DeleteProfileUseCase(this.repository);

  Future<Either<Failure, DeleteProfileEntity>> call() async {
    return await repository.deleteProfile();
  }
}
