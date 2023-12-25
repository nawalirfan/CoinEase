import 'package:coin_ease/colors.dart';
import 'package:coin_ease/screens/auth/phone_verification.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  void _handleLogout() async {
    try {
      await _auth.signOut();
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => PhoneVerification()),
      );
    } catch (e) {
      print('Error during logout: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colors['primary'],
        title: const Text('Settings'),
      ),
      body: Column(
        children: [
          GestureDetector(
            onTap: () {
              _handleLogout();
            },
            child: Row(
              children: [
                Icon(
                  Icons.logout_outlined,
                  size: 40,
                ),
                Text(
                  'Logout',
                  style: TextStyle(fontSize: 25),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
