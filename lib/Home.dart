import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold
    (
    appBar: AppBar(backgroundColor: Colors.blueAccent,),
     body: Container
     (
          child: const Center
          (
            child: Text
            (
              'Home Screen',
              style: TextStyle(fontSize: 15, color: Colors.black),
            ),
          ),
        ),
    );
  }
}