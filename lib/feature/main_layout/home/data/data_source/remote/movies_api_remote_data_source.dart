import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/core/errors/app_exception.dart';
import 'package:movies_app/core/resources/constants_manager.dart';
import 'package:movies_app/feature/main_layout/home/data/data_source/remote/movies_remote_data_source.dart';
import 'package:movies_app/feature/main_layout/home/data/models/movies_response/movies_response.dart';

@Singleton(as: MoviesRemoteDataSource)
class MoviesApiRemoteDataSource implements MoviesRemoteDataSource {
  final Dio dio = Dio(BaseOptions(baseUrl: ApiConstant.baseURL));
  @override
  Future<MoviesResponse> getMovies() async {
    try {
      Response response = await dio.get(ApiConstant.listMoviesEndPoint);
      return MoviesResponse.fromJson(response.data);
    } catch (exception) {
      String? message;
      if (exception is DioException) {
        message = exception.response?.data['message'];
      }
      throw RemoteException(message: message ?? 'Failed to get Movies');
    }
  }

  @override
  Future<MoviesResponse> getMoviesGenres(String? genre) async {
    try {
      Response response = await dio.get(
        ApiConstant.listMoviesEndPoint,
        queryParameters: {'genre': genre},
      );
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
