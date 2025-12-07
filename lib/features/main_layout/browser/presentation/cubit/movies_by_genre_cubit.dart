import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/features/main_layout/browser/domain/use_cases/get_movies_use_case.dart';
import 'package:movies_app/features/main_layout/home/domain/entities/movies_entity.dart';

@injectable
class MoviesByGenreCubit extends Cubit<GenresState> {
  MoviesByGenreCubit({required this.getMoviesUseCase}) : super(GenreMoviesInitial());

  GetMoviesUseCase getMoviesUseCase;

  Future<void> getMoviesByGenre(String? genre) async {
    emit(GenreMoviesLoading());
    final result = await getMoviesUseCase.getMoviesByGenre(genre);
    result.fold(
          (failure) => emit(GenreMoviesError(failure.message)),
          (movies) => emit(GenreMoviesSuccess(movies)),
    );
  }
}

abstract class GenresState {}

class GenreMoviesInitial extends GenresState {}
class GenreMoviesSuccess extends GenresState {
  final List<MoviesEntity> movies;

  GenreMoviesSuccess(this.movies);
}

class GenreMoviesLoading extends GenresState {}

class GenreMoviesError extends GenresState {
  final String message;
  GenreMoviesError(this.message);
}
