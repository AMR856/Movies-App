import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movies_app/features/authentication/services/api_client.dart';
import 'package:movies_app/features/authentication/models/auth_response.dart';

class AuthService {
  final ApiClient apiClient;
  AuthService({ApiClient? client}) : apiClient = client ?? ApiClient();

  Future<AuthResponse> register(String name, String email, String password) async {
    final path = '/auth/register';
    final body = {
      'name': name,
      'email': email,
      'password': password,
    };

    final http.Response resp = await apiClient.post(path, body);
    final statusCode = resp.statusCode;
    final data = jsonDecode(resp.body);

    if (statusCode == 200 || statusCode == 201) {
      return AuthResponse.fromJson(data);
    } else {
      final msg = data is Map && data.containsKey('message') ? data['message'] : 'Registration failed';
      throw Exception(msg);
    }
  }
}
