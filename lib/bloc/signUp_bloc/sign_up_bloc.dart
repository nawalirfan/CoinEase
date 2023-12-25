import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:coin_ease/bloc/signUp_bloc/sign_up_event.dart';
import 'package:coin_ease/bloc/signUp_bloc/sign_up_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:coin_ease/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  SignUpBloc() : super(SignUpInitial()) {
    on<SignUpButtonPressed>(_onSignUpButtonPressed);
  }

  String getCardNumber(String phoneNumber) {
    String last12Digits = phoneNumber.substring(phoneNumber.length - 12);
    int number = int.parse(last12Digits);
    String transformedNumberStr = number.toString().padLeft(16, '0');

    return transformedNumberStr;
  }

  Future<bool> register(UserModel user) async {
    try {
      Map<String, dynamic> accountData = {
        'accountNumber': user.phoneNumber.replaceAll('+', ''),
        'title': '${user.name} CoinEase',
        'balance': 100.0,
        'accountType': 'mastercard',
        'iban': 'PK99-COEZ-0000-${user.phoneNumber.replaceAll('+', '')}',
        'bankName': 'Coin Ease',
        'cardNo': getCardNumber(user.phoneNumber),
        'isActive': true,
      };

      Map<String, dynamic> userData = {
        'phoneNumber': user.phoneNumber,
        'password': user.password,
        'name': user.name,
        'cnic': user.cnic,
        'dateOfIssuance': user.dateOfIssuance,
        'motherName': user.motherName,
        'account': accountData
      };

      DocumentReference userRef =
          await FirebaseFirestore.instance.collection('users').add(userData);
      print('User account created!');
      return true;
    } catch (e) {
      print('Error while registering a user: ${e}');
      return false;
    }
  }

  void _onSignUpButtonPressed(
    SignUpButtonPressed event,
    Emitter<SignUpState> emit,
  ) async {
    emit(SignUpLoading());
    try {
      UserModel userModel = UserModel(
        id: event.id,
        phoneNumber: event.phoneNumber,
        password: event.password,
        name: event.name,
        cnic: event.cnic,
        dateOfIssuance: event.dateOfIssuance,
        motherName: event.motherName,
      );

      bool result = await register(userModel);
      if (result) {
        emit(SignUpSuccess());
      } else {
        emit(const SignUpFailure(error: "Failed to register user"));
      }
    } catch (error) {
      emit(SignUpFailure(error: error.toString()));
    }
  }
}