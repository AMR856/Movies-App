import 'package:flutter/material.dart';
import 'package:movies_app/features/main_layout/home/domain/entities/movies_entity.dart';
import 'package:movies_app/features/main_layout/search/domain/use_cases/get_search_movie_use_case.dart';
import 'package:injectable/injectable.dart';

@injectable
class SearchProvider extends ChangeNotifier {
  GetSearchMovieUseCase getSearchMovieUseCase;
  SearchProvider({
    required this.getSearchMovieUseCase,
  });
  List<MoviesEntity> moviesList = [];
  bool isLoading = false;
  String? errorMessage;
  Future<void> getSearchMovies(String? keySearch) async {
    if (keySearch!.isEmpty) {
      moviesList = [];
      errorMessage = null;
      notifyListeners();
      return;
    }
    isLoading = true;
    notifyListeners();

    final result = await getSearchMovieUseCase.getSearchMovies(keySearch);
    result.fold(
      (failure) {
        isLoading = false;
        notifyListeners();
        errorMessage = failure.message;
      },
      (movies) {
        isLoading = false;
        notifyListeners();
        moviesList = movies;
      },
    );
  }
}
