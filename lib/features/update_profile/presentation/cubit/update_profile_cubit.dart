import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/features/update_profile/data/models/update_profile_request.dart';
import 'package:movies_app/features/update_profile/domain/entities/delete_profile_entity.dart';
import 'package:movies_app/features/update_profile/domain/entities/update_profile_entity.dart';
import 'package:movies_app/features/update_profile/domain/use_cases/delete_profile_use_case.dart';
import 'package:movies_app/features/update_profile/domain/use_cases/update_profile_use_case.dart';

@injectable
class UpdateProfileCubit extends Cubit<UpdateProfileState> {
  final UpdateProfileUseCase _updateUseCase;
  final DeleteProfileUseCase _deleteUseCase;

  UpdateProfileCubit(
      this._updateUseCase,
      this._deleteUseCase,
      ) : super(UpdateProfileInitial());

  Future<void> updateProfile(UpdateProfileRequest request) async {
    emit(UpdateProfileLoading());

    final result = await _updateUseCase.call(request);

    result.fold(
          (failure) => emit(UpdateProfileError(failure.message ?? "Unknown error")),
          (entity) => emit(UpdateProfileSuccess(entity)),
    );
  }

  Future<void> deleteProfile() async {
    emit(DeleteProfileLoading());

    final result = await _deleteUseCase.call();

    result.fold(
          (failure) => emit(DeleteProfileError(failure.message)),
          (entity) => emit(DeleteProfileSuccess(entity)),
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

class DeleteProfileLoading extends UpdateProfileState {}
class DeleteProfileSuccess extends UpdateProfileState {
  final DeleteProfileEntity result;
  DeleteProfileSuccess(this.result);
}
class DeleteProfileError extends UpdateProfileState {
  final String message;
  DeleteProfileError(this.message);
}

