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
      appBar: AppBar(
        // leading: IconButton(
        //   icon: const Icon(Icons.arrow_back),
        //   onPressed: () {
        //     Navigator.push(
        //       context,
        //       MaterialPageRoute(builder: (context) => const LogIn()),
        //     );
        //   },
        // ),
        backgroundColor: const Color.fromARGB(255, 201, 200, 200),
        elevation: 0,
      ),
     body: Container
     (
          child: Center(
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