import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/features/movie_details/domain/use_cases/delete_favorite_use_case.dart';

abstract class DeleteFavoriteState {}

class DeleteFavoriteInitial extends DeleteFavoriteState {}
class DeleteFavoriteLoading extends DeleteFavoriteState {}
class DeleteFavoriteSuccess extends DeleteFavoriteState {
  final String message;
  DeleteFavoriteSuccess(this.message);
}
class DeleteFavoriteError extends DeleteFavoriteState {
  final String message;
  DeleteFavoriteError(this.message);
}

@injectable
class DeleteFavoriteCubit extends Cubit<DeleteFavoriteState> {
  final DeleteFavoriteUseCase useCase;
  DeleteFavoriteCubit(this.useCase) : super(DeleteFavoriteInitial());

  Future<void> deleteFavorite(String movieId) async {
    emit(DeleteFavoriteLoading());
    final result = await useCase(movieId);
    result.fold(
          (failure) => emit(DeleteFavoriteError(failure.message)),
          (response) => emit(DeleteFavoriteSuccess(response.message ?? 'Deleted successfully')),
    );
  }
}
