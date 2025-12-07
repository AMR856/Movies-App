import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:movies_app/utils/constants.dart';

class AuthController extends ChangeNotifier {
  bool _isLoading = false;
  String? _errorMessage;
  String? _token;

  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;
  String? get token => _token;

  void _saveToken(String? newToken) {
    _token = newToken;
  }

  void setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  Future<http.Response> _post(String path, Map<String, dynamic> body) async {
    final uri = Uri.parse('${Constants.BASE_URL}$path');
    final headers = Constants.jsonHeaders;

    return await http.post(uri, headers: headers, body: jsonEncode(body));
  }

  // ------------------------------
  // PATCH Request Handler
  Future<http.Response> _patch(String path, Map<String, dynamic> body, {String? token}) async {
    final uri = Uri.parse('${Constants.BASE_URL}$path');

    final Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    };

    if (token != null) {
      headers['Authorization'] = 'Bearer $token';
    }

    return await http.patch(uri, headers: headers, body: jsonEncode(body));
  }

  // Error Handler
  String _handleErrorMessage(dynamic data, String defaultMessage) {
    // حاول استخراج الأخطاء من مفاتيح مختلفة
    dynamic error = data['errors'] ?? data['message'];

    if (error == null) return defaultMessage;

    if (error is List) return error.join(', ');
    if (error is String) return error;

    return "$defaultMessage (Unknown Error Format)";
  }

  // Register
  Future<void> register({
    required String name,
    required String email,
    required String password,
    required String confirmPassword,
    required String phone,
    required String avatar,
  }) async {
    setLoading(true);
    _errorMessage = null;

    try {
      final avatarIdInt = int.tryParse(avatar);

      final response = await _post('/auth/register', {
        "name": name,
        "email": email,
        "password": password,
        "confirmPassword": confirmPassword,
        "phone": phone,
        "avaterId": avatarIdInt,
      });

      final data = jsonDecode(response.body);

      if (response.statusCode == 201) {
        _saveToken(data['token']);
      } else {
        _errorMessage = _handleErrorMessage(data, "Registration failed");
      }
    } catch (e) {
      _errorMessage = "Something went wrong: $e";
    } finally {
      setLoading(false);
    }
  }

  // Login
  Future<void> login(String email, String password) async {
    setLoading(true);
    _errorMessage = null;

    try {
      final response = await _post('/auth/login', {
        "email": email,
        "password": password,
      });

      final data = jsonDecode(response.body);

      if (response.statusCode == 200) {
        _saveToken(data['token']);
      } else {
        _errorMessage = _handleErrorMessage(data, "Login failed");
      }
    } catch (e) {
      _errorMessage = "Something went wrong: $e";
    } finally {
      setLoading(false);
    }
  }

}