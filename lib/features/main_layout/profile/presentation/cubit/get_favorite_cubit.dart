import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/features/main_layout/profile/domain/entites/favorite_entity.dart';
import 'package:movies_app/features/main_layout/profile/domain/use_cases/get_favorite_use_case.dart';

@injectable
class FavoritesCubit extends Cubit<FavoritesState> {
  FavoritesCubit({required this.getFavoritesUseCase})
      : super(FavoritesInitial());

  final GetFavoritesUseCase getFavoritesUseCase;

  Future<void> getFavorites() async {
    emit(FavoritesLoading());

    final result = await getFavoritesUseCase.call();

    result.fold(
          (failure) => emit(FavoritesError(failure.message)),
          (favorites) => emit(FavoritesSuccess(favorites)),
    );
  }
}

abstract class FavoritesState {}

class FavoritesInitial extends FavoritesState {}

class FavoritesLoading extends FavoritesState {}

class FavoritesSuccess extends FavoritesState {
  final List<FavoriteEntity> favorites;

  FavoritesSuccess(this.favorites);
}

class FavoritesError extends FavoritesState {
  final String message;

  FavoritesError(this.message);
}