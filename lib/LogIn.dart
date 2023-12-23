import 'package:coin_ease/Home.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LogIn extends StatefulWidget {
  const LogIn({Key? key}) : super(key: key);

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color.fromARGB(255, 201, 200, 200),
        child: SafeArea(
          child: Center(
            child: ListView(
              shrinkWrap: true,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 20.0, left: 20.0),
                      child: Text(
                        'Log In',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 157, 128, 164),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Container(
                        child: IntlPhoneField(
                          controller: _phoneNumberController,
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(
                            labelText: 'Phone Number',
                            filled: true,
                            fillColor: Colors.white.withOpacity(0.3),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: const BorderSide(
                                color: Color.fromARGB(255, 3, 3, 3),
                              ),
                            ),
                          ),
                          initialCountryCode: 'PK',
                        ),
                      ),
                    ),
                    const SizedBox(height: 4.0),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: TextField(
                        obscureText: true,
                        controller: _passwordController,
                        style: const TextStyle(
                          fontSize: 18,
                          color: Color.fromARGB(255, 0, 0, 0),
                        ),
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.lock),
                          labelText: 'Password',
                          filled: true,
                          fillColor: Colors.white.withOpacity(0.3),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: const BorderSide(
                              color: Color.fromARGB(255, 0, 0, 0),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 25.0),
                    SizedBox(
                      width: 420,
                      height: 60,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: ElevatedButton(
                          onPressed: () async {
                            String phoneNumber = _phoneNumberController.text.trim();
                            String password = _passwordController.text;

                            if (phoneNumber.isNotEmpty && password.isNotEmpty) {
                              await signInWithPhoneAndPassword(phoneNumber, password);
                            } else {
                              // Handle empty fields
                              print('Please enter phone number and password');
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            primary: const Color.fromARGB(255, 157, 128, 164),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                          ),
                          child: const Text('Sign In', style: TextStyle(fontSize: 20)),
                        ),
                      ),
                    ),
                    // Rest of the code...
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> signInWithPhoneAndPassword(String phoneNumber, String password) async {
    try {
      // Use Firebase Authentication to sign in with phone number and password
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: '$phoneNumber', // Firebase requires an email address
        password: password,
      );

      // You can access the signed-in user using userCredential.user

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const Home(), // Navigate to Home screen on successful sign-in
        ),
      );
    } catch (e) {
      // Handle sign-in errors
      print('Error signing in: $e');
      // You can display an error message to the user
    }
  }
}
