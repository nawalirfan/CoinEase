import 'package:coin_ease/core/network.dart';
import 'package:coin_ease/core/repository/user_repo.dart';
import 'package:coin_ease/screens/auth/phone_verification.dart';
import 'package:coin_ease/screens/auth/sign_up.dart';
import 'package:coin_ease/screens/settings.dart';
import 'package:coin_ease/screens/auth/sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';



class MyApp extends StatelessWidget 
{
  final UserRepository userRepository;
  const MyApp(this.userRepository, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    User? currentUser = FirebaseAuth.instance.currentUser;

    return MaterialApp(
      home: currentUser == null
          ? const PhoneVerification()
          : SignIn(phoneNumber: currentUser.phoneNumber ?? ""),
      debugShowCheckedModeBanner: false,
    );
  }
}

void main() async 
{
 await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
 runApp(MyApp(FirebaseUserRepo()));
}

