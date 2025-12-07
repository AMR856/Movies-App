import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/core/errors/app_exception.dart';
import 'package:movies_app/core/resources/constants_manager.dart';
import 'package:movies_app/features/update_profile/data/data_source/remote/update_profile_remote_data_source.dart';
import 'package:movies_app/features/update_profile/data/models/delete_profile_response.dart';
import 'package:movies_app/features/update_profile/data/models/update_profile_request.dart';
import 'package:movies_app/features/update_profile/data/models/update_profile_response.dart';

@Singleton(as: UpdateProfileRemoteDataSource)
class UpdateProfileRemoteDataSourceImpl implements UpdateProfileRemoteDataSource {
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

  @override
  Future<DeleteProfileResponse> deleteProfile() async {
    try {
      final response = await dio.delete(
        ApiConstant.deleteProfileEndpoint,
      );

      return DeleteProfileResponse.fromJson(response.data);
    } catch (exception) {
      String? message;

      if (exception is DioException) {
        message = exception.response?.data['message'] ?? exception.message;
      }

      throw RemoteException(message: message ?? 'Failed to delete profile');
    }
  }
}
