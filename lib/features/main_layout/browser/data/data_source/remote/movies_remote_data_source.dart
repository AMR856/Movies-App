
import 'package:movies_app/features/main_layout/browser/data/models/movies_response/movies_response.dart';

abstract class MoviesRemoteDataSource {
  Future<MoviesResponse> getMoviesByGenre(String? genre);
}
