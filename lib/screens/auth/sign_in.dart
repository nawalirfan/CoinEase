import 'package:coin_ease/colors.dart';
import 'package:coin_ease/models/user_model.dart';
import 'package:coin_ease/screens/home_page.dart';
import 'package:coin_ease/screens/auth/phone_verification.dart';
import 'package:coin_ease/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class SignIn extends StatefulWidget {
  final String? phoneNumber;
  const SignIn({super.key, this.phoneNumber = ''});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  TextEditingController passwordController = TextEditingController();
  bool error = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView(
          shrinkWrap: true,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20.0, left: 20.0),
                  child: Text(
                    'Enter Password',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: colors['primary'],
                    ),
                  ),
                ),
                const SizedBox(height: 20.0),
                // Padding(
                //   padding: const EdgeInsets.only(left: 20, right: 20),
                //   child: IntlPhoneField(
                //     keyboardType: TextInputType.phone,
                //     decoration: InputDecoration(
                //       labelText: 'Phone Number',
                //       filled: true,
                //       fillColor: Colors.white,
                //       border: OutlineInputBorder(
                //         borderRadius: BorderRadius.circular(10.0),
                //       ),
                //     ),
                //     initialCountryCode: 'PK',
                //   ),
                // ),
                const SizedBox(height: 4.0),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: TextField(
                    controller: passwordController,
                    obscureText: true,
                    style: const TextStyle(
                        fontSize: 18, color: Color.fromARGB(255, 0, 0, 0)),
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.lock),
                      labelText: 'Password',
                      filled: true,
                      fillColor: Colors.white,
                      errorText: error ? 'Incorrect Password' : null,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
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
                        AuthService _authService = AuthService();
                        UserModel? loginUser =
                            await _authService.signIn(passwordController.text);
                        if (loginUser != null) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => HomePage()),
                          );
                        } else {
                          print('login unsuccessful');
                          setState(() {
                            error = true;
                          });
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: colors['primary'],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                      child: const Text('Continue',
                          style: TextStyle(fontSize: 20)),
                    ),
                  ),
                ),
                const SizedBox(height: 20.0),
                Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 20.0),
                      child: Text(
                        "Don't have an account?",
                        style: TextStyle(
                            fontSize: 17, color: Color.fromARGB(255, 0, 0, 0)),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const PhoneVerification()),
                        );
                      },
                      child: Text(
                        'Sign Up',
                        style:
                            TextStyle(fontSize: 17, color: colors['primary']),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const PhoneVerification()),
                          );
                        },
                        child: Text(
                          'Forgot Password?',
                          style:
                              TextStyle(fontSize: 17, color: colors['primary']),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
