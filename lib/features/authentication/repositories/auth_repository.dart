import '../services/auth_service.dart';
import '../models/auth_response.dart';

class AuthRepository {
  final AuthService service;
  AuthRepository({AuthService? service}) : service = service ?? AuthService();

  Future<AuthResponse> register(String name, String email, String password) {
    return service.register(name, email, password);
  }
}
