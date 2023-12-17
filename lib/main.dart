import 'package:coin_ease/screens/phone_verification.dart';
import 'package:coin_ease/screens/sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: (FirebaseAuth.instance.currentUser == null)
          ? const PhoneVerification()
          : SignIn(phoneNumber: FirebaseAuth.instance.currentUser?.phoneNumber),
      debugShowCheckedModeBanner: false,
    );
  }
}
