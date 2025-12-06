import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/core/errors/app_exception.dart';
import 'package:movies_app/core/resources/constants_manager.dart';
import 'package:movies_app/features/main_layout/profile/data/models/profile_response/favorite_response.dart';
import 'package:movies_app/features/update_profile/data/data_source/remote/update_profile_remote_data_source.dart';
import 'package:movies_app/features/update_profile/data/models/update_profile_request.dart';
import 'package:movies_app/features/update_profile/data/models/update_profile_response.dart';

@Singleton(as: UpdateProfileRemoteDataSource)
class UpdateProfileRemoteDataSourceImpl implements UpdateProfileRemoteDataSource {
  final Dio dio = Dio(
    BaseOptions(
      baseUrl: ApiConstant.routeBaseURL,
      headers: {
        'Authorization':
        'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY5MzFkMWQyMjczNGMyNzBlNTc5NTBmOCIsImVtYWlsIjoiYW1lci5saXZlNDc3QGdtYWlsLmNvbSIsImlhdCI6MTc2NDk0MDY0NH0.qg6ux-Tz-onaMWnYJv40kX3wm6-147DpUrgRdIt9790',
        'Content-Type': 'application/json',
      },
    ),
  );

  @override
  Future<FavoriteResponse> deleteProfile() {
    throw UnimplementedError();
  }

  @override
  Future<UpdateProfileResponse> updateProfile(UpdateProfileRequest request) async {
    try {
      final response = await dio.patch(
        ApiConstant.updateProfileEndpoint,
        data: request.toJson(),
      );
      return UpdateProfileResponse.fromJson(response.data);
    } catch (exception) {
      String? message;

      if (exception is DioException) {
        message = exception.response?.data['message'] ?? exception.message;
      }
      throw RemoteException(message: message ?? 'Failed to update profile');
    }
  }
}
