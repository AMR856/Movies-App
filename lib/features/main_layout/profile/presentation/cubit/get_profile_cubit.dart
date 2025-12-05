import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/features/main_layout/profile/domain/entites/profile_entity.dart';
import 'package:movies_app/features/main_layout/profile/domain/use_cases/get_profile_use_case.dart';

@injectable
class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit({required this.getProfileUseCase}) : super(ProfileInitial());

  final GetProfileUseCase getProfileUseCase;

  Future<void> getProfile() async {
    emit(ProfileLoading());
    final result = await getProfileUseCase.call();
    result.fold(
          (failure) => emit(ProfileError(failure.message)),
          (profile) => emit(ProfileSuccess(profile)),
    );
  }
}

abstract class ProfileState {}

class ProfileInitial extends ProfileState {}

class ProfileLoading extends ProfileState {}

class ProfileSuccess extends ProfileState {
  final ProfileEntity profile;

  ProfileSuccess(this.profile);
}

class ProfileError extends ProfileState {
  final String message;

  ProfileError(this.message);
}
