import 'package:coin_ease/bloc/signin_bloc/sign_in_repo.dart';
import 'package:coin_ease/models/user_model.dart';

class MockSignInRepository1 implements SignInRepository {
  Future<UserModel?> signIn(String password) async {
    if (password == 'correct_password') {
      return UserModel(
          id: '1',
          phoneNumber: '1234567890',
          password: 'password',
          name: 'John Doe',
          cnic: '1234567890123',
          dateOfIssuance: '01/01/2022',
          motherName: 'Jane Doe',
          role: 'user');
    } else {
      return null;
    }
  }
}
