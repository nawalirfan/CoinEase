import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart'; // Add this import

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coin_ease/bloc/signUp_bloc/sign_up_bloc.dart';
import 'package:coin_ease/bloc/signUp_bloc/sign_up_event.dart';
import 'package:coin_ease/bloc/signUp_bloc/sign_up_state.dart';
import 'package:coin_ease/colors.dart';
import 'package:coin_ease/models/user_model.dart';
import 'package:coin_ease/screens/auth/sign_in.dart';
import 'package:coin_ease/services/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
class SignUpDetails extends StatefulWidget {
  final String phoneNumber;
  const SignUpDetails({super.key, required this.phoneNumber});

  @override
  State<SignUpDetails> createState() => _SignUpDetailsState();
}

class _SignUpDetailsState extends State<SignUpDetails> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  TextEditingController nameController = TextEditingController();
  TextEditingController cnicController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController mNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController cPasswordController = TextEditingController();
  bool passError = false;

  final AuthService _authService = AuthService();

  Future<bool> saveUser() async {
    if (passwordController.text == cPasswordController.text) {
      UserModel user = UserModel(
          id: '',
          phoneNumber: widget.phoneNumber,
          password: passwordController.text,
          name: nameController.text,
          cnic: cnicController.text,
          dateOfIssuance: dateController.text,
          motherName: mNameController.text);

      bool isRegistered = await _authService.register(user);
      return isRegistered;
    } else {
      print('plz enter same passwords');
      setState(() {
        passError = true;
      });
      return false;
    }
  }

  void navigate() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SignIn()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignUpBloc(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: colors['primary'],
          leading: const Icon(Icons.arrow_back),
          title: const Text('Personal Details'),
        ),
        body: BlocBuilder<SignUpBloc, SignUpState>(
          builder: (context, state) {
            if (state is SignUpButtonPressed) {
              return  const Center
              (child: CircularProgressIndicator());
            }
            else if (state is SignUpFailure){
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: 
                [
                  const Text('Error: Sign up failed'),
                  ElevatedButton(
                    onPressed: () {
                    },
                    child: const Text('Retry'),
                  ),
                ],
              );
            }
            else if(state is SignUpSuccess)
            {
              return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Sign up successful!'),
                ElevatedButton(
                  onPressed: () {
                    navigate();
                  },
                  child: const Text('sign up'),
                ),
              ],
            );
            }
            else 
            {
              return Container
            (
              padding: const EdgeInsets.only(
                  top: 30, bottom: 30, right: 30, left: 30),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Sign Up',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: colors['primary'],
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'Name: ',
                      style: TextStyle(fontSize: 18),
                    ),
                    const SizedBox(height: 5),
                    TextField(
                      controller: nameController,
                      decoration: InputDecoration(
                          filled: true,
                          contentPadding:
                              const EdgeInsets.symmetric(vertical: 10),
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          )),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'CNIC Number: ',
                      style: TextStyle(fontSize: 18),
                    ),
                    const SizedBox(height: 5),
                    TextField(
                      controller: cnicController,
                      maxLength: 13,
                      decoration: InputDecoration(
                          filled: true,
                          contentPadding:
                              const EdgeInsets.symmetric(vertical: 10),
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          )),
                    ),
                    const SizedBox(height: 5),
                    const Text(
                      'Date of Issuance (CNIC): ',
                      style: TextStyle(fontSize: 18),
                    ),
                    const SizedBox(height: 5),
                    TextField(
                      controller: dateController,
                      decoration: InputDecoration(
                          filled: true,
                          contentPadding:
                              const EdgeInsets.symmetric(vertical: 10),
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          )),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Mother\'s Name: ',
                      style: TextStyle(fontSize: 18),
                    ),
                    const SizedBox(height: 5),
                    TextField(
                      controller: mNameController,
                      decoration: InputDecoration(
                          filled: true,
                          contentPadding:
                              const EdgeInsets.symmetric(vertical: 10),
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          )),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Password: ',
                      style: TextStyle(fontSize: 18),
                    ),
                    const SizedBox(height: 5),
                    TextField(
                      controller: passwordController,
                      decoration: InputDecoration(
                          filled: true,
                          contentPadding:
                              const EdgeInsets.symmetric(vertical: 10),
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          )),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Confirm Password: ',
                      style: TextStyle(fontSize: 18),
                    ),
                    const SizedBox(height: 5),
                    TextField(
                      controller: cPasswordController,
                      decoration: InputDecoration(
                          filled: true,
                          contentPadding:
                              const EdgeInsets.symmetric(vertical: 10),
                          fillColor: Colors.white,
                          errorText: passError ? 'Passwords dont match' : null,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          )),
                    ),
                    const SizedBox(height: 40),
                    SizedBox(
                      height: 60,
                      width: double.infinity,
                      child: ElevatedButton(
                          onPressed: () async {
                            bool saved = await saveUser();
                            if (saved) navigate();
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: colors['primary'],
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Register',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              Icon(Icons.arrow_forward)
                            ],
                          )),
                    )
                  ],
                ),
              ),
            );

            }
              
            
          },
        ),
      ),
    );
  }
}
