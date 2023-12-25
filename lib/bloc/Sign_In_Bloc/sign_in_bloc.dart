import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:coin_ease/bloc/Sign_In_Bloc/sign_in_event.dart';
import 'package:coin_ease/bloc/Sign_In_Bloc/sign_in_state.dart';
import 'package:coin_ease/models/user_model.dart';
import 'package:coin_ease/services/auth_service.dart';
import 'package:meta/meta.dart';


class SignInBloc extends Bloc<SignInEvent, SignInState> {
  final AuthService _authService = AuthService();

  SignInBloc() : super(SignInInitialState());

  @override
  Stream<SignInState> mapEventToState(SignInEvent event) async* {
    if (event is SignInButtonPressed) {
      yield SignInLoadingState();

      try {
        UserModel? loginUser = await _authService.signIn(event.password);
        if (loginUser != null) {
          yield SignInSuccessState(user: loginUser);
        } else {
          yield SignInErrorState(errorMessage: 'Login unsuccessful');
        }
      } catch (e) {
        yield SignInErrorState(errorMessage: 'An error occurred');
      }
    }
  }
}
