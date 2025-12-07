import 'package:movies_app/features/main_layout/home/data/models/movies_response/movies_response.dart';

abstract class SearchRemoteDataSource{
 Future<MoviesResponse> getSearchMovie(String? keySearch);
}