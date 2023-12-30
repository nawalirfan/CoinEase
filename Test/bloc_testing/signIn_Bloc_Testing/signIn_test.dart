import 'package:coin_ease/services/auth_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:coin_ease/bloc/Sign_In_Bloc/sign_in_bloc.dart'; // Import your SignInBloc
import 'package:coin_ease/bloc/Sign_In_Bloc/sign_in_event.dart';
import 'package:coin_ease/bloc/Sign_In_Bloc/sign_in_state.dart';

import 'mockRepository.dart'; // Import your repository or mock repository

void main() {
  group('SignInBloc', () {
    late SignInBloc signInBloc;

    setUp(() {
      // Create a mock repository or use your real repository for testing
      final repository = MockSignInRepository1();
      signInBloc = SignInBloc( repository as AuthService);
    });

    test('Initial state is SignInInitial', () {
      expect(signInBloc.state, equals(SignInInitial()));
    });

    test('Emits SignInSuccess for correct password', () {
      final correctPassword = 'correct_password'; // Replace with the correct password
      final expectedStates = [
        SignInLoading(),
        SignInSuccess(isAdmin: false), // Modify as needed
      ];

      expectLater(signInBloc.stream, emitsInOrder(expectedStates));

      signInBloc.add(SignInButtonPressed(password: correctPassword));
    });

    test('Emits SignInFailure for incorrect password', () {
      final incorrectPassword = 'incorrect_password'; // Replace with an incorrect password
      final expectedStates = [
        SignInLoading(),
        SignInFailure(error: 'Incorrect Password'),
      ];

      expectLater(signInBloc.stream, emitsInOrder(expectedStates));

      signInBloc.add(SignInButtonPressed(password: incorrectPassword));
    });

    tearDown(() {
      signInBloc.close();
    });
  });
}