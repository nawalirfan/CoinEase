import 'package:coin_ease/bloc/user/user_bloc.dart';
import 'package:coin_ease/bloc/user/user_event.dart';
import 'package:coin_ease/colors.dart';
import 'package:coin_ease/models/user_model.dart';
import 'package:coin_ease/screens/auth/phone_verification.dart';
import 'package:coin_ease/services/user_service.dart';
import 'package:coin_ease/widgets/bottom_navbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  final UserBloc userBloc = UserBloc();
  UserModel? user;
  SettingsScreen({super.key, this.user});

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
    TextEditingController cnic = TextEditingController(text: widget.user!.cnic);
    TextEditingController doi =
        TextEditingController(text: widget.user!.dateOfIssuance);
    TextEditingController mname =
        TextEditingController(text: widget.user!.motherName);

    void _handleUpdate() {
      widget.userBloc.add(UpdateUserEvent(
          cnic.text, doi.text, widget.user!.phoneNumber, mname.text));
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: colors['primary'],
        title: const Text('Settings'),
      ),
      body: SingleChildScrollView(
          child: Column(
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
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                    ),
                    Text(widget.user!.name,
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold))
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    const Text(
                      'Phone Number: ',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                    ),
                    Text(
                      widget.user!.phoneNumber,
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'CNIC: ',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                    ),
                    Flexible(
                        child: TextField(
                      maxLength: 13,
                      controller: cnic,
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ))
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Date Of Issuance: ',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                    ),
                    Flexible(
                        child: TextField(
                      controller: doi,
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ))
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Mother\'s Name:  ',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                    ),
                    Flexible(
                        child: TextField(
                      controller: mname,
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
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
                  _handleUpdate();
                  // UserService service = UserService();
                  // service.updateUserDetailsByPhoneNumber(
                  //     widget.user!.phoneNumber,
                  //     cnic.text,
                  //     doi.text,
                  //     mname.text);
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: colors['primary']),
                child: const Text('Update'),
              ),
              const SizedBox(width: 20)
            ],
          )
        ],
      )),
      bottomNavigationBar: BNavBar(index: 2, user: widget.user),
    );
  }
}

// GestureDetector(
//             onTap: () {
//               _handleLogout();
//             },
//             child: const Row(
//               children: [
//                 Icon(
//                   Icons.logout_outlined,
//                   size: 40,
//                 ),
//                 Text(
//                   'Logout',
//                   style: TextStyle(fontSize: 25),
//                 )
//               ],
//             ),
//           )
