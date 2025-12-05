import 'package:movies_app/features/main_layout/profile/data/models/profile_response/favorite_response.dart';
import 'package:movies_app/features/main_layout/profile/data/models/profile_response/profile_response.dart';

abstract class ProfileRemoteDataSource {
  Future<ProfileResponse> getProfile();
  Future<FavoriteResponse> getFavorites();
}
