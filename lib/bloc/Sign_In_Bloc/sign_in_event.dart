import 'package:equatable/equatable.dart';

abstract class SignInEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class SignInButtonPressed extends SignInEvent {
  final String password;

  SignInButtonPressed({required this.password});

  @override
  List<Object> get props => [password];
}