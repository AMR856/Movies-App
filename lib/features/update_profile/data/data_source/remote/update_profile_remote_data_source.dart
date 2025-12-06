import 'package:movies_app/features/main_layout/profile/data/models/profile_response/favorite_response.dart';
import 'package:movies_app/features/update_profile/data/models/update_profile_request.dart';
import 'package:movies_app/features/update_profile/data/models/update_profile_response.dart';

abstract class UpdateProfileRemoteDataSource {
  Future<UpdateProfileResponse> updateProfile(UpdateProfileRequest request);
  Future<FavoriteResponse> deleteProfile();
  // reset password
}
