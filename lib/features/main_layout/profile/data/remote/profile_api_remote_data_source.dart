import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/core/errors/app_exception.dart';
import 'package:movies_app/core/prefs/prefs_manager.dart';
import 'package:movies_app/core/resources/constants_manager.dart';
import 'package:movies_app/features/main_layout/profile/data/models/profile_response/favorite_response.dart';
import 'package:movies_app/features/main_layout/profile/data/models/profile_response/profile_response.dart';
import 'package:movies_app/features/main_layout/profile/data/remote/profile_remote_data_source.dart';

@Singleton(as: ProfileRemoteDataSource)
class ProfileApiRemoteDataSource implements ProfileRemoteDataSource {
  late final Dio dio;

  ProfileApiRemoteDataSource() {
    dio = Dio(
      BaseOptions(
        baseUrl: ApiConstant.routeBaseURL,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ${PrefsManager.getToken()}',
        },
      ),
    );
  }

  @override
  Future<ProfileResponse> getProfile() async {
    try {
      final response = await dio.get(ApiConstant.profileEndpoint);
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
