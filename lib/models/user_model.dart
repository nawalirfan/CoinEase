import 'package:coin_ease/models/account_model.dart';

class UserModel {
  final String id;
  final String phoneNumber;
  final String password;
  final String name;
  final String cnic;
  final String dateOfIssuance;
  final String motherName;
  final UserAccount? account;

  UserModel({
    required this.id,
    required this.phoneNumber,
    required this.password,
    required this.name,
    required this.cnic,
    required this.dateOfIssuance,
    required this.motherName,
    this.account
  });
}
