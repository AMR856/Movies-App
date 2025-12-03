import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/feature/main_layout/home/domain/entities/movies_entity.dart';
import 'package:movies_app/feature/main_layout/home/domain/use_cases/get_movies_use_case.dart';

@injectable
class GenresCubit extends Cubit<GenresState> {
  GenresCubit({required this.getMoviesUseCase}) : super(GenresInitial());

  GetMoviesUseCase getMoviesUseCase;

  Future<void> getMoviesGenres(String? genre) async {
    emit(GenresLoading());
    final result = await getMoviesUseCase.getMoviesGenres(genre);
    result.fold(
      (failure) => emit(GenresError(failure.message)),
      (movies) => emit(GenresSuccess(movies)),
    );
  }
}

abstract class GenresState {}

class GenresInitial extends GenresState {}

class GenresSuccess extends GenresState {
  final List<MoviesEntity> genres;

  GenresSuccess(this.genres);
}

class GenresLoading extends GenresState {}

class GenresError extends GenresState {
  final String message;
  GenresError(this.message);
}
