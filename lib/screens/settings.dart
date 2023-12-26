import 'package:coin_ease/bloc/user/user_bloc.dart';
import 'package:coin_ease/bloc/user/user_event.dart';
import 'package:coin_ease/bloc/user/user_state.dart';
import 'package:coin_ease/colors.dart';
import 'package:coin_ease/models/user_model.dart';
import 'package:coin_ease/screens/auth/phone_verification.dart';
import 'package:coin_ease/screens/home_page.dart';
import 'package:coin_ease/widgets/bottom_navbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsScreen extends StatefulWidget {
  final UserBloc userBloc = UserBloc();
  UserModel? user;
  SettingsScreen({super.key, this.user});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  bool loading = false;
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
    TextEditingController cnic = TextEditingController(text: widget.user!.cnic);
    TextEditingController doi =
        TextEditingController(text: widget.user!.dateOfIssuance);
    TextEditingController mname =
        TextEditingController(text: widget.user!.motherName);

    return BlocListener<UserBloc, User_State>(
      listener: (context, state) {
        if (state is LoadingUserState) {
          setState(() {
            loading = true;
          });
        } else if (state is LoadedUserState) {
          setState(() {
            loading = false;
          });

          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const HomePage()),
          );
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('User updated Successfully!')));
        } else if (state is ErrorUserState) {
          setState(() {
            loading = false;
          });
        }
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: colors['primary'],
          title: const Text('Settings'),
        ),
        body: SingleChildScrollView(
            child: loading
                ? const CircularProgressIndicator()
                : Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.all(20),
                        padding: const EdgeInsets.all(20),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: colors['secondary'],
                            borderRadius: BorderRadius.circular(15)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              child: Image.asset('assets/profile.jpeg'),
                            ),
                            const SizedBox(height: 30),
                            Row(
                              children: [
                                const Text(
                                  'Name: ',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500),
                                ),
                                Text(widget.user!.name,
                                    style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold))
                              ],
                            ),
                            const SizedBox(height: 20),
                            Row(
                              children: [
                                const Text(
                                  'Phone Number: ',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500),
                                ),
                                Text(
                                  widget.user!.phoneNumber,
                                  style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  'CNIC: ',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500),
                                ),
                                Flexible(
                                    child: TextField(
                                  maxLength: 13,
                                  controller: cnic,
                                  style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ))
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  'Date Of Issuance: ',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500),
                                ),
                                Flexible(
                                    child: TextField(
                                  controller: doi,
                                  style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ))
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  'Mother\'s Name:  ',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500),
                                ),
                                Flexible(
                                    child: TextField(
                                  controller: mname,
                                  style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ))
                              ],
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              // handleUpdate();
                              context.read<UserBloc>().add(
                                    UpdateUserEvent(cnic.text, doi.text,
                                        widget.user!.phoneNumber, mname.text),
                                  );
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: colors['primary']),
                            child: const Text('Update'),
                          ),
                          const SizedBox(width: 20)
                        ],
                      ),
                      const SizedBox(height: 100),
                      Container(
                          // child: Flexible(
                          padding: EdgeInsets.all(20),
                          child: ElevatedButton(
                              onPressed: () {
                                _handleLogout();
                              },
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: colors['primary']),
                              child: const Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.logout_outlined,
                                    size: 30,
                                  ),
                                  Text(
                                    'Logout',
                                    style: TextStyle(fontSize: 20),
                                  )
                                ],
                              ))),
                      // )
                    ],
                  )),
        bottomNavigationBar: BNavBar(index: 2, user: widget.user),
      ),
    );
  }
}
