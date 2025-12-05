import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/features/movie_details/domain/entities/movie_suggestion_entity.dart';
import 'package:movies_app/features/movie_details/domain/use_cases/get_details_movie_use_case.dart';

@injectable
class MovieSuggestionsCubit extends Cubit<MovieSuggestionsState> {
 MovieSuggestionsCubit({required this.getDetailsMovieUseCase}) : super(MovieSuggestionsInitial());

  GetDetailsMovieUseCase getDetailsMovieUseCase;

  Future<void> getMovieSuggestions(int? movieId) async {
    emit(MovieSuggestionsLoading());
    final result = await getDetailsMovieUseCase.getMovieSuggestions(movieId);
    result.fold(
      (failure) => emit(MovieSuggestionsError(failure.message)),
      (movies) => emit(MovieSuggestionsSuccess(movies)),
    );
  }
}

abstract class MovieSuggestionsState {}

class MovieSuggestionsInitial extends MovieSuggestionsState {}

class MovieSuggestionsSuccess extends MovieSuggestionsState {
  final List<MovieSuggestionEntity> movieSuggestions;

  MovieSuggestionsSuccess(this.movieSuggestions);
}

class MovieSuggestionsLoading extends MovieSuggestionsState {}

class MovieSuggestionsError extends MovieSuggestionsState {
  final String message;
  MovieSuggestionsError(this.message);
}
