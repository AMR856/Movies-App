import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/core/errors/app_exception.dart';
import 'package:movies_app/core/resources/constants_manager.dart';
import 'package:movies_app/features/movie_details/data/data_source/remote/details_remote_data_source.dart';
import 'package:movies_app/features/movie_details/data/models/details_response.dart';
import 'package:movies_app/features/movie_details/data/models/movie_suggestions_response.dart';

@Singleton(as: DetailsRemoteDataSource)
class DetailsApiRemoteDataSource implements DetailsRemoteDataSource {
  final Dio dio = Dio(BaseOptions(baseUrl: ApiConstant.baseURL));
  @override
  Future<DetailsResponse> getDetailsMovie(int? movieId) async {
    try {
      Response response = await dio.get(
        ApiConstant.movieDetailsEndPoint,
        queryParameters: {
          'movie_id': movieId,
          'with_cast': true,
          'with_images': true,
        },
      );
      return DetailsResponse.fromJson(response.data);
    } catch (exception) {
      String? message;
      if (exception is DioException) {
        message = exception.response!.data['message'];
      }
      throw RemoteException(message: message ?? 'Failed to get Details Movies');
    }
  }

  @override
  Future<MovieSuggestionsResponse> getMovieSuggestions(int? movieId) async {
    try {
      Response response = await dio.get(
        ApiConstant.movieSuggestionsEndPoint,
        queryParameters: {'movie_id': movieId},
      );
      return MovieSuggestionsResponse.fromJson(response.data);
    } catch (exception) {
      String? message;
      if (exception is DioException) {
        message = exception.response?.data['message'];
      }
      throw RemoteException(message: message ?? 'Failed to get Movies Genres');
    }
  }
}
