import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/core/errors/app_exception.dart';
import 'package:movies_app/core/resources/constants_manager.dart';
import 'package:movies_app/features/main_layout/browser/data/models/movies_response/movies_response.dart';
import 'movies_remote_data_source.dart';

@Singleton(as: MoviesRemoteDataSource)
class MoviesApiRemoteDataSource implements MoviesRemoteDataSource {
  final Dio dio = Dio(BaseOptions(baseUrl: ApiConstant.baseURL));

  @override
  Future<MoviesResponse> getMoviesByGenre(String? genre) async {
    try {
      Response response = await dio.get(
        ApiConstant.listMoviesEndPoint,
        queryParameters: {'genre': genre},
      );
      print(response.data);
      return MoviesResponse.fromJson(response.data);
    } catch (exception) {
      String? message;
      if (exception is DioException) {
        message = exception.response?.data['message'];
      }
      throw RemoteException(message: message ?? 'Failed to get Movies Genres');
    }
  }
}
