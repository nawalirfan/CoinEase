import 'package:coin_ease/bloc/user/user_bloc.dart';
import 'package:coin_ease/colors.dart';
import 'package:coin_ease/models/user_model.dart';
import 'package:coin_ease/screens/auth/phone_verification.dart';
import 'package:coin_ease/widgets/bottom_navbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  final UserBloc userBloc = UserBloc();
  final UserModel? user;

  SettingsScreen({Key? key, this.user}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  bool loading = false;

  void _handleLogout() async {
    try {
      await _auth.signOut();
      // Navigator.push(
      //   context,
      //   MaterialPageRoute(builder: (context) => PhoneVerification()),
      // );
      Navigator.pushNamed(context, '/Phone_verification');

    } catch (e) {
      print('Error during logout: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold
    (
      appBar: AppBar(
        backgroundColor: colors['primary'],
        title: const Text('Settings'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 30.0, left: 10),
        child: Row(
          children: 
          [
            ElevatedButton(
            onPressed: () {
              _handleLogout();
            },
            
            child: const Row(
              children: [
                Icon(
                  Icons.logout_outlined,
                  color: Colors.black,
                  size: 30,
                ),
                Text(
                  'Logout',
                  style: TextStyle(fontSize: 20, color: Colors.black),
                ),
              ],
            ),
          ),
          ],
        ),
      ),
    
  
      
      
   
         
          
      bottomNavigationBar: BNavBar(index: 2, user: widget.user),
    );
  }
}