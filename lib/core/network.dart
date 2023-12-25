import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coin_ease/core/repository/user_repo.dart';
import 'package:coin_ease/models/user_model.dart';
import 'package:coin_ease/screens/auth/sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart' as FirebaseAuth;
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseUserRepo implements UserRepository {
  final FirebaseAuth.FirebaseAuth _firebaseAuth;
  final CollectionReference usersCollection = FirebaseFirestore.instance.collection('users');

  FirebaseUserRepo({
    FirebaseAuth.FirebaseAuth? firebaseAuth,
  }) : _firebaseAuth = firebaseAuth ?? FirebaseAuth.FirebaseAuth.instance;

  @override
  Stream<User?> get user { 
    return _firebaseAuth.authStateChanges().map((firebaseUser) {
      return firebaseUser;
    });
  }

 Future<UserModel?> SignIn(String phoneNumber, String password) async {
  try {
    await _firebaseAuth.signInWithEmailAndPassword(
      email: phoneNumber,
      password: password,
    );
  } catch (e) {
    log(e.toString());
    rethrow;
  }
}

  @override
  Future<UserModel> signUp(UserModel myUser, String password) async {
    try {
      FirebaseAuth.UserCredential user =
          await _firebaseAuth.createUserWithEmailAndPassword(
        email: myUser.phoneNumber!,
        password: password,
      );

      return myUser;
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }



  @override
  Future<void> logOut() async {
    await _firebaseAuth.signOut();
  }
  
  
  @override
  Future<void> setUserData(user) {
    throw UnimplementedError();
  }
  
  @override
  Future<UserModel> signIn(String phoneNumber, String password) {
    // TODO: implement signIn
    throw UnimplementedError();
  }
}
