import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/feature/main_layout/home/domain/entities/movies_entity.dart';
import 'package:movies_app/feature/main_layout/home/domain/use_cases/get_movies_use_case.dart';

@injectable
class MoviesCubit extends Cubit<MoviesState> {
  MoviesCubit({required this.getMoviesUseCase}) : super(MoviesInitial());

  GetMoviesUseCase getMoviesUseCase;
    int currentIndex = 0;

  Future<void> getMovies() async {
    emit(MoviesLoading());
    final result = await getMoviesUseCase.getMovies();
    result.fold(
      (failure) => emit(MoviesError(failure.message)),
      (movies) => emit(MoviesSuccess(movies)),
    );
  }
    void changeCarouselIndex(int index) {
    if (state is MoviesSuccess) {
      final currentState = state as MoviesSuccess;
      emit(MoviesSuccess(currentState.movies, index));
    }
  }

  int get currentCarouselIndex => currentIndex;
}

abstract class MoviesState {}

class MoviesInitial extends MoviesState {}

class MoviesSuccess extends MoviesState {
  final List<MoviesEntity> movies;
  final int currentCarouselIndex;

  MoviesSuccess(this.movies, [this.currentCarouselIndex = 0]);
}

class MoviesLoading extends MoviesState {}

class MoviesError extends MoviesState {
  final String message;
  MoviesError(this.message);
}
