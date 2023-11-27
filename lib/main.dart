import 'package:coin_ease/OTP.dart';
import 'package:coin_ease/LogIn.dart';
import 'package:coin_ease/SignUp.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';


void main() async 
{
  await Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(const MyApp());
}
class MyApp extends StatelessWidget 
{
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) 
  {
    return const  MaterialApp
    (
      home:  LogIn(),
      debugShowCheckedModeBanner: false,
    );
    
  }
  
  
}
