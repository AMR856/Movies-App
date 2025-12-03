import 'package:movies_app/feature/main_layout/home/data/models/movies_response/movies_response.dart';

abstract class MoviesRemoteDataSource {
  Future<MoviesResponse> getMovies();
  Future<MoviesResponse> getMoviesGenres(String? genre);
}
