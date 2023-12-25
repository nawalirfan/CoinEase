import 'package:coin_ease/models/user_model.dart';
import 'package:coin_ease/services/auth_service.dart';

class SignInRepository {
  final AuthService _authService = AuthService();

  Future<UserModel?> signIn(String password) async {
    return await _authService.signIn(password);
  }
}