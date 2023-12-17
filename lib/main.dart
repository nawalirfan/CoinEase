import 'package:coin_ease/OTP/otp_Screen1.dart';
import 'package:coin_ease/screens/home_page.dart';
import 'package:coin_ease/screens/otp_pin.dart';
import 'package:coin_ease/screens/phone_verification.dart';
import 'package:coin_ease/screens/sign_in.dart';
import 'package:coin_ease/screens/sign_up.dart';
import 'package:coin_ease/LogIn.dart';
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
    return const MaterialApp(
      home: PhoneVerification(),
      debugShowCheckedModeBanner: false,
    );
  }
}
