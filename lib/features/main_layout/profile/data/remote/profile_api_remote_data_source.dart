import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/core/errors/app_exception.dart';
import 'package:movies_app/core/resources/constants_manager.dart';
import 'package:movies_app/features/main_layout/profile/data/models/profile_response/favorite_response.dart';
import 'package:movies_app/features/main_layout/profile/data/models/profile_response/profile_response.dart';
import 'package:movies_app/features/main_layout/profile/data/remote/profile_remote_data_source.dart';

@Singleton(as: ProfileRemoteDataSource)
class ProfileApiRemoteDataSource implements ProfileRemoteDataSource {
  final Dio dio = Dio(
    BaseOptions(
      baseUrl: ApiConstant.routeBaseURL,
      headers: {
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY5MzU2MWYzMWRlYjEwMjRmMWU4YWM2NiIsImVtYWlsIjoiYW1lci5saXZlNDc3QGdtYWlsLmNvbSIsImlhdCI6MTc2NTEwNjE3Mn0.emdN3wDMv1jFHpOVw5XFxAzGJW9mhZwPZIMXwxmhoJw',
        'Content-Type': 'application/json',
      },
    ),
  );

  @override
  Future<ProfileResponse> getProfile() async {
    try {
      Response response = await dio.get(ApiConstant.profileEndpoint);
      return ProfileResponse.fromJson(response.data);
    } catch (exception) {
      String? message;
      if (exception is DioException) {
        message = exception.response?.data['message'] ?? exception.message;
      }
      throw RemoteException(message: message ?? 'Failed to get Profile');
    }
  }

  @override
  Future<FavoriteResponse> getFavorites() async {
    try {
      final response = await dio.get(ApiConstant.favoritesAllEndpoint);
      return FavoriteResponse.fromJson(response.data);
    } catch (exception) {
      String? message;
      if (exception is DioException) {
        message = exception.response?.data['message'] ?? exception.message;
      }
      throw RemoteException(message: message ?? 'Failed to get Favorites');
    }
  }
}
