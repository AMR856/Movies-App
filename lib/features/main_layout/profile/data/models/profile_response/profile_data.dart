import 'package:movies_app/features/main_layout/profile/domain/entites/profile_entity.dart';

class ProfileData {
  final String id;
  final String email;
  final String password;
  final String name;
  final String phone;
  final int avaterId;
  final String createdAt;
  final String updatedAt;
  final int v;

  ProfileData({
    required this.id,
    required this.email,
    required this.password,
    required this.name,
    required this.phone,
    required this.avaterId,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  factory ProfileData.fromJson(Map<String, dynamic> json) {
    return ProfileData(
      id: json['_id'] ?? '',
      email: json['email'] ?? '',
      password: json['password'] ?? '',
      name: json['name'] ?? '',
      phone: json['phone'] ?? '',
      avaterId: (json['avaterId'] ?? 0).toInt(),
      createdAt: json['createdAt'] ?? '',
      updatedAt: json['updatedAt'] ?? '',
      v: json['__v'] ?? 0,
    );
  }

  ProfileEntity toProfileEntity() =>
      ProfileEntity(avatarId: avaterId, name: name);
}
