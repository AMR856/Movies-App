import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/features/update_profile/data/models/update_profile_request.dart';
import 'package:movies_app/features/update_profile/domain/entities/update_profile_entity.dart';
import 'package:movies_app/features/update_profile/domain/use_cases/update_profile_use_case.dart';

@injectable
class UpdateProfileCubit extends Cubit<UpdateProfileState> {
  final UpdateProfileUseCase useCase;

  UpdateProfileCubit(this.useCase) : super(UpdateProfileInitial());

  Future<void> updateProfile(UpdateProfileRequest request) async {
    emit(UpdateProfileLoading());

    final result = await useCase.call(request);

    result.fold(
          (failure) => emit(UpdateProfileError(failure.message ?? "Unknown Error")),
          (entity) => emit(UpdateProfileSuccess(entity)),
    );
  }
}

abstract class UpdateProfileState {}

class UpdateProfileInitial extends UpdateProfileState {}

class UpdateProfileLoading extends UpdateProfileState {}

class UpdateProfileSuccess extends UpdateProfileState {
  final UpdateProfileEntity entity;
  UpdateProfileSuccess(this.entity);
}

class UpdateProfileError extends UpdateProfileState {
  final String message;
  UpdateProfileError(this.message);
}

