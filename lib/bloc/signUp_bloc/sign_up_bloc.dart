import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:coin_ease/bloc/signUp_bloc/sign_up_event.dart';
import 'package:coin_ease/bloc/signUp_bloc/sign_up_state.dart';
import 'package:firebase_auth/firebase_auth.dart';


class SignUpBloc extends Bloc<SignUpEvent, SignUpState> 
{
  final FirebaseAuth _auth = FirebaseAuth.instance;

  SignUpBloc() : super(SignUpInitial());

  @override
  Stream<SignUpState> mapEventToState(SignUpEvent event) async* 
  {
    if (event is SignUpButtonPressed) 
    {
      yield SignUpLoading();
      try {
        await _auth.createUserWithEmailAndPassword(
          email: event.phoneNumber,
          password: event.password,
        );

        yield SignUpSuccess();
      } catch (error) {
        yield SignUpFailure(error: error.toString());
      }
    }
  }
}
