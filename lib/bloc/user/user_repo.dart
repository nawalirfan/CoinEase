import 'package:coin_ease/services/user_service.dart';

class User_Repository {
  final UserService service = UserService();

  Future<void> updateUser(String phone, String mname, String cnic, String doi) async {
    return service.updateUserDetailsByPhoneNumber(phone, cnic, doi, mname);
  }



}
