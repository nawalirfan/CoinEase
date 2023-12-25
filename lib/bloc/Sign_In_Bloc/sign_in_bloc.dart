import 'package:bloc/bloc.dart';
import 'package:coin_ease/bloc/Sign_In_Bloc/sign_in_event.dart';
import 'package:coin_ease/bloc/Sign_In_Bloc/sign_in_state.dart';
import 'package:coin_ease/models/user_model.dart';
import 'package:coin_ease/services/auth_service.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  final AuthService _authService;

  SignInBloc(this._authService) : super(SignInInitial()) {
    on<SignInButtonPressed>(_onSignInButtonPressed);
  }

  void _onSignInButtonPressed(
      SignInButtonPressed event, Emitter<SignInState> emit) async {
    emit(SignInLoading());
    try {
      UserModel? loginUser = await _authService.signIn(event.password);
      if (loginUser != null) {
        emit(SignInSuccess());
      } else {
        emit(SignInFailure(error: 'Incorrect Password'));
      }
    } catch (e) {
      emit(SignInFailure(error: e.toString()));
    }
  }
}