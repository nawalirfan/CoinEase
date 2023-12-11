
import 'package:coin_ease/LogIn.dart';
import 'package:coin_ease/OTP/otp_Screen1.dart';
import 'package:coin_ease/Sign_UP/signup_Screen1.dart';
import 'package:coin_ease/Sign_UP/signup_Screen2.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';


void main() async 
{
    await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  runApp(const MyApp());
}
class MyApp extends StatelessWidget 
{
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) 
  {
    return   MaterialApp
    (
      home:  SignUp(),
      debugShowCheckedModeBanner: false,
    );
    
  } 
}
