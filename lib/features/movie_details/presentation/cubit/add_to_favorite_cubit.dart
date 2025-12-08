import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:dartz/dartz.dart';
import 'package:movies_app/core/errors/failure.dart';
import 'package:movies_app/features/movie_details/data/models/add_favorite_request.dart';
import 'package:movies_app/features/movie_details/domain/use_cases/add_favorite_use_case.dart';
import 'package:movies_app/features/movie_details/domain/entities/add_favorite_entity.dart';

@injectable
class AddFavoriteCubit extends Cubit<AddFavoriteState> {
  final AddFavoriteUseCase addFavoriteUseCase;

  AddFavoriteCubit(this.addFavoriteUseCase) : super(AddFavoriteInitial());

  Future<void> addToFavorite(AddFavoriteRequest request) async {
    emit(AddFavoriteLoading());
    Either<Failure, AddFavoriteEntity> result = await addFavoriteUseCase(request);
    result.fold(
          (failure) => emit(AddFavoriteError(failure.message)),
          (entity) => emit(AddFavoriteSuccess(entity.message)),
    );
  }
}

abstract class AddFavoriteState {}

class AddFavoriteInitial extends AddFavoriteState {}

class AddFavoriteLoading extends AddFavoriteState {}

class AddFavoriteSuccess extends AddFavoriteState {
  final String message;
  AddFavoriteSuccess(this.message);
}

class AddFavoriteError extends AddFavoriteState {
  final String message;
  AddFavoriteError(this.message);
}
