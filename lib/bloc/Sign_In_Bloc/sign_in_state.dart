import 'package:coin_ease/models/user_model.dart';
import 'package:equatable/equatable.dart';

abstract class SignInState extends Equatable {
  @override
  List<Object> get props => [];
}

class SignInInitial extends SignInState {}

class SignInLoading extends SignInState {}

class SignInSuccess extends SignInState {}

class SignInFailure extends SignInState {
  final String error;

  SignInFailure({required this.error});

  @override
  List<Object> get props => [error];
}
