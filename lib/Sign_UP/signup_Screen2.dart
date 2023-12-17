
import 'package:coin_ease/LogIn.dart';
import 'package:coin_ease/Sign_UP/signup_Screen1.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SignUp1 extends StatefulWidget {
  final String userId;

  const SignUp1({super.key, required this.userId});

  @override
  State<SignUp1> createState() => _Signup1State();
}

class _Signup1State extends State<SignUp1> {
  bool obscurePassword = true;
  bool obscureConfirmPassword = true;
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController countrycode = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const SignUp()),
            );
          },
        ),
        backgroundColor: const Color.fromARGB(255, 201, 200, 200),
        elevation: 0,
      ),
      body: Container(
        color: const Color.fromARGB(255, 201, 200, 200),
        child: SafeArea(
          child: Center(
            child: ListView(
              shrinkWrap: true,
              children: [
                const SizedBox(
                  height: 100,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 20.0),
                      child: Text(
                        'Sign Up',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 157, 128, 164),
                        ),
                      ),
                    ),
                    const SizedBox(height: 40.0),
                    const SizedBox(height: 40.0),
                    const Padding(
                      padding: EdgeInsets.only(left: 20, right: 20),
                      child: Text(
                        'Phone Number',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 0, 0, 0),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Form(
                        key: _formKey,
                        child: Container(
                          child: IntlPhoneField(
                            controller: phoneNumberController,
                            keyboardType: TextInputType.phone,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white.withOpacity(0.3),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: const BorderSide(
                                  color: Color.fromARGB(255, 3, 3, 3),
                                ),
                              ),
                            ),
                            onSaved: (phone) {
                              countrycode.text = phone?.countryISOCode ?? '';
                            },
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 0.0),
                    buildPasswordTextField('Password', obscurePassword),
                    const SizedBox(height: 30.0),
                    buildPasswordTextField(
                      'Confirm Password', obscureConfirmPassword),
                    const SizedBox(height: 250),
                    SizedBox(
                      width: 420,
                      height: 60,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: ElevatedButton(
                          onPressed: () async {
                            if (_formKey.currentState?.validate() ?? false) {
                              _formKey.currentState?.save();
                              await storeUserDataInFirestore();
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const LogIn(),
                                ),
                              );
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color.fromARGB(255, 157, 128, 164),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                          ),
                          child: const Text('Sign UP',
                              style: TextStyle(
                                  fontSize: 20, color: Colors.black)),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildPasswordTextField(String labelText, bool obscureText) 
  {
    return Column
    (
      crossAxisAlignment: CrossAxisAlignment.start,
      children: 
      [
        Padding
        (
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Text
          (
            labelText,
            style: const TextStyle
            (
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 0, 0, 0),
            ),
          ),
        ),
        Padding
        (
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: TextField
          (
            obscureText: obscureText,
            controller: labelText == 'Password'? passwordController: confirmPasswordController,
            style: const TextStyle
            (
              fontSize: 15,
              color: Color.fromARGB(255, 0, 0, 0),
            ),
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white.withOpacity(0.3),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: const BorderSide(
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
              ),
              suffixIcon: GestureDetector
              (
                onTap: () {
                  setState(() {
                    if (labelText == 'Password') {
                      obscurePassword = !obscurePassword;
                    } else if (labelText == 'Confirm Password') {
                      obscureConfirmPassword = !obscureConfirmPassword;
                    }
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Icon
                  (
                    obscureText ? Icons.visibility : Icons.visibility_off
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Future<void> storeUserDataInFirestore() async {
    try
    {
      String phoneNumber = phoneNumberController.text;
      String password = passwordController.text;
      if (countrycode.text.isNotEmpty) 
      {
        await FirebaseFirestore.instance.collection('users').doc(widget.userId).update({
          'phoneNumber': phoneNumber,
          'countryCode': countrycode.text,
          'password': password,
        });
      } 
      else 
      {
        print('Error: Country code is empty');
      }
    } 
    catch (e)
    {
      print('Error storing user data: $e');
      
    }
  }
}
