
import 'package:movies_app/features/update_profile/domain/entities/delete_profile_entity.dart';

class DeleteProfileResponse {
  String? message;

  DeleteProfileResponse({this.message});

  DeleteProfileResponse.fromJson(dynamic json) {
    message = json['message'];
  }

  DeleteProfileEntity toDeleteProfileEntity() =>
      DeleteProfileEntity(message: message);
}
