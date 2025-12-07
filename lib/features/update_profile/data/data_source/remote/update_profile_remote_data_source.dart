import 'package:movies_app/features/update_profile/data/models/delete_profile_response.dart';
import 'package:movies_app/features/update_profile/data/models/update_profile_request.dart';
import 'package:movies_app/features/update_profile/data/models/update_profile_response.dart';

abstract class UpdateProfileRemoteDataSource {
  Future<UpdateProfileResponse> updateProfile(UpdateProfileRequest request);
  Future<DeleteProfileResponse> deleteProfile();
  // reset password
}
