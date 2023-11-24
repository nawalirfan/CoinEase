import 'package:coin_ease/Reset_Password.dart';
import 'package:coin_ease/LogIn.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget 
{
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) 
  {
    return  MaterialApp
    (
      home: LogIn(),
      debugShowCheckedModeBanner: false,
      routes: {
    '/resetPassword': (context) => Resest_Password(),
    
  },
    );
  }
}
