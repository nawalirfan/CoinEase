import 'package:equatable/equatable.dart';

abstract class SignInEvent  extends Equatable{}

class SignInButtonPressed extends SignInEvent {
  final String password;

  SignInButtonPressed({required this.password});
  
  @override
  // TODO: implement props
  List<Object?> get props => [password];
}
