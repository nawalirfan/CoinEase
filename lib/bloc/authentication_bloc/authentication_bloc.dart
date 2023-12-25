import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:coin_ease/bloc/authentication_bloc/authentication_event.dart';
import 'package:coin_ease/bloc/authentication_bloc/authentication_state.dart';
import 'package:coin_ease/core/repository/user_repo.dart';
import 'package:firebase_auth/firebase_auth.dart';


class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState> {
  final UserRepository userRepository;
	late final StreamSubscription<User?> _userSubscription;

	AuthenticationBloc({
		required this.userRepository
	}) : super(const AuthenticationState.unknown()) {
    _userSubscription = userRepository.user.listen((user) {
			add(AuthenticationUserChanged(user));
		});
		on<AuthenticationUserChanged>((event, emit) {
			if(event.user != null) {
				emit(AuthenticationState.authenticated(event.user!));
			} else {
				emit(const AuthenticationState.unauthenticated());
			}
		});
  }
	@override
  Future<void> close() {
    _userSubscription.cancel();
    return super.close();
  }
}