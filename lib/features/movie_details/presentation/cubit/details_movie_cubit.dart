import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/features/movie_details/domain/entities/details_entity.dart';
import 'package:movies_app/features/movie_details/domain/use_cases/get_details_movie_use_case.dart';

@injectable
class DetailsMovieCubit extends Cubit<DetailsMovieState> {
  DetailsMovieCubit({required this.getDetailsMovieUseCase})
    : super(DetailsMovieInitial());

  GetDetailsMovieUseCase getDetailsMovieUseCase;

  Future<void> getDetailsMovie(int? movieId) async {
    emit(DetailsMovieLoading());
    final result = await getDetailsMovieUseCase.getDetailsMovie(movieId);
    result.fold(
      (failure) => emit(DetailsMovieError(failure.message)),
      (detailsMovie) => emit(DetailsMovieSuccess(detailsMovie)),
    );
  }
}

abstract class DetailsMovieState {}

class DetailsMovieInitial extends DetailsMovieState {}

class DetailsMovieSuccess extends DetailsMovieState {
  final DetailsEntity detailsMovie;

  DetailsMovieSuccess(
    this.detailsMovie,
  );
}

class DetailsMovieLoading extends DetailsMovieState {}

class DetailsMovieError extends DetailsMovieState {
  final String message;
  DetailsMovieError(this.message);
}
