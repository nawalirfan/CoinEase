import 'package:coin_ease/models/account_model.dart';
import 'package:equatable/equatable.dart';

abstract class SignUpEvent extends Equatable {
  const SignUpEvent();

  @override
  List<Object?> get props => [];
}

class SignUpButtonPressed extends SignUpEvent {
  final String id;
  final String phoneNumber;
  final String password;
  final String name;
  final String cnic;
  final String dateOfIssuance;
  final String motherName;
  final UserAccount? account;

  const SignUpButtonPressed({
    required this.id,
    required this.phoneNumber,
    required this.password,
    required this.name,
    required this.cnic,
    required this.dateOfIssuance,
    required this.motherName,
    required this.account,
  });

  @override
  List<Object?> get props => [
        id,
        phoneNumber,
        password,
        name,
        cnic,
        dateOfIssuance,
        motherName,
        account
      ];
}
