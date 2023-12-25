import 'dart:async';
import 'package:coin_ease/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class UserRepository //in video he  use 2 files and make the class abstract
{
	Stream<User?> get user;

	Future<UserModel> signUp(UserModel myUser, String password);

	Future<void> setUserData(UserModel user);

	Future<void> signIn(String phoneNumber, String password);

	Future<void> logOut();
}