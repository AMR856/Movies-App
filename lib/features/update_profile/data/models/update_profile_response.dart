import 'package:movies_app/features/update_profile/domain/entities/update_profile_entity.dart';

class UpdateProfileResponse {
  String? message;

  UpdateProfileResponse({this.message});

  UpdateProfileResponse.fromJson(dynamic json) {
    message = json['message'];
  }

  UpdateProfileEntity toUpdateProfileEntity() =>
      UpdateProfileEntity(message: message);
}
