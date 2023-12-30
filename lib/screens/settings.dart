import 'package:coin_ease/bloc/user/user_bloc.dart';
import 'package:coin_ease/colors.dart';
import 'package:coin_ease/models/user_model.dart';
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
  bool isDarkModeEnabled = false;

  void _handleLogout() async {
    try {
      await _auth.signOut();
      Navigator.pushNamed(context, '/Phone_verification');
    } catch (e) {
      print('Error during logout: $e');
    }
  }

  void _toggleTheme() {
    setState(() {
      isDarkModeEnabled = !isDarkModeEnabled;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        title: const Text('Settings'),
      ),
      body: Padding(
          padding: const EdgeInsets.only(top: 30.0, left: 10),
          child: Column(
            children: [
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     Text(
              //       'Dark Mode',
              //       style: TextStyle(fontSize: 20),
              //     ),
              //     Switch(
              //       value: isDarkModeEnabled,
              //       onChanged: (value) {
              //         _toggleTheme();
              //         setState(() {
              //           isDarkModeEnabled = value;
              //         });
              //       },
              //       activeColor: AppColors.primaryColor,
              //     ),
              //   ],
              // ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      _handleLogout();
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primaryColor),
                    child: const Row(
                      children: [
                        Icon(
                          Icons.logout_outlined,
                          color: Colors.white,
                          size: 30,
                        ),
                        Text(
                          'Logout',
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          )),
      bottomNavigationBar: BNavBar(index: 2, user: widget.user),
    );
  }
}
