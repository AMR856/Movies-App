import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/core/errors/failure.dart';
import 'package:movies_app/features/main_layout/profile/domain/entites/profile_entity.dart';
import 'package:movies_app/features/main_layout/profile/domain/repositories/get_profile_repository.dart';

@lazySingleton
class GetProfileUseCase {
  final ProfileRepository profileRepository;

  GetProfileUseCase({
    required this.profileRepository,
  });

  Future<Either<Failure, ProfileEntity>> call() async {
    return await profileRepository.getProfile();
  }
}
