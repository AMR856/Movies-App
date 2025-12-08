import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/features/movie_details/domain/entities/is_favorite_entity.dart';
import 'package:movies_app/features/movie_details/domain/use_cases/is_favorite_use_case.dart';

@injectable
class IsFavoriteCubit extends Cubit<IsFavoriteState> {
  final GetIsFavoriteUseCase getIsFavoriteUseCase;

  IsFavoriteCubit({required this.getIsFavoriteUseCase}) : super(IsFavoriteInitial());

  Future<void> checkFavorite(String movieId) async {
    emit(IsFavoriteLoading());
    final result = await getIsFavoriteUseCase(movieId);
    result.fold(
          (failure) => emit(IsFavoriteError(failure.message)),
          (entity) => emit(IsFavoriteSuccess(entity)),
    );
  }
}

abstract class IsFavoriteState {}

class IsFavoriteInitial extends IsFavoriteState {}

class IsFavoriteLoading extends IsFavoriteState {}

class IsFavoriteSuccess extends IsFavoriteState {
  final IsFavoriteEntity entity;
  IsFavoriteSuccess(this.entity);
}

class IsFavoriteError extends IsFavoriteState {
  final String message;
  IsFavoriteError(this.message);
}