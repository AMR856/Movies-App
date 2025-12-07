import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/core/errors/app_exception.dart';
import 'package:movies_app/core/resources/constants_manager.dart';
import 'package:movies_app/features/main_layout/home/data/models/movies_response/movies_response.dart';
import 'package:movies_app/features/main_layout/search/data/data_source/remote/search_remote_data_source.dart';
@Singleton(as: SearchRemoteDataSource)
class SearchApiRemoteDataSource implements SearchRemoteDataSource {
  final Dio dio = Dio(BaseOptions(baseUrl: ApiConstant.baseURL));
  @override
  Future<MoviesResponse> getSearchMovie(String? keySearch) async {
    try {
      Response response = await dio.get(
        ApiConstant.listMoviesEndPoint,
        queryParameters: {'query_term': keySearch},
      );
      return MoviesResponse.fromJson(response.data);
    } catch (exception) {
      String? message;
      if (exception is DioException) {
        message = exception.response?.data['message'];
      }
      throw RemoteException(message: message ?? 'Failed to get Movies');
    }
  }
}
