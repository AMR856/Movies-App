// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:injectable/injectable.dart';
// import 'package:movies_app/features/main_layout/home/domain/entities/movies_entity.dart';
// import 'package:movies_app/features/main_layout/search/domain/use_cases/get_search_movie_use_case.dart';

// @injectable
// class SearchCubit extends Cubit<SearchState> {
//   SearchCubit({required this.getSearchMovieUseCase}) : super(SearchInitial());

//   GetSearchMovieUseCase getSearchMovieUseCase;
   

//   Future<void> getSearchMovies(String? keySearch) async {
//     emit(SearchLoading());
//     final result = await getSearchMovieUseCase.getSearchMovies(keySearch);
//     result.fold(
//       (failure) => emit(SearchError(failure.message)),
//       (movies) => emit(SearchSuccess(movies)),
//     );
//   }
// }

// abstract class SearchState {}

// class SearchInitial extends SearchState {}

// class SearchSuccess extends SearchState {
//   final List<MoviesEntity> searchMovies;
//   final int currentCarouselIndex;

//   SearchSuccess(this.searchMovies, [this.currentCarouselIndex = 0]);
// }

// class SearchLoading extends SearchState {}

// class SearchError extends SearchState {
//   final String message;
//   SearchError(this.message);
// }
