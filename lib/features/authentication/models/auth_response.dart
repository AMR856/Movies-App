import 'user_model.dart';

class AuthResponse {
  final String status;
  final String? token;
  final UserModel? user;
  final String? message;

  AuthResponse({required this.status, this.token, this.user, this.message});

  factory AuthResponse.fromJson(Map<String, dynamic> json) {
    return AuthResponse(
      status: json['status'] ?? '',
      token: json['token'],
      user: json['user'] != null ? UserModel.fromJson(json['user']) : null,
      message: json['message'],
    );
  }
}
