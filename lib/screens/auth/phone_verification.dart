import 'dart:math';

import 'package:coin_ease/colors.dart';
import 'package:coin_ease/screens/auth/otp_pin.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class PhoneVerification extends StatefulWidget {
  const PhoneVerification({super.key});
  static String verify = "";

  @override
  State<PhoneVerification> createState() => _PhoneVerificationState();
}

class _PhoneVerificationState extends State<PhoneVerification> {
  TextEditingController countrycode = TextEditingController();
  var phone = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/verification.jpg',
                width: 250,
                height: 250,
              ),
              const Text(
                'Phone Verification',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              const Text('Register your phone before getting started!',
                  style: TextStyle(fontSize: 16)),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: IntlPhoneField(
                  onChanged: (value) {
                    phone = value.completeNumber;
                  },
                  initialCountryCode: 'PK',
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
                ),
              ),
              ElevatedButton(
                  onPressed: () async {
                    await FirebaseAuth.instance.verifyPhoneNumber(
                      phoneNumber: countrycode.text + phone,
                      verificationCompleted:
                          (PhoneAuthCredential credential) {},
                      verificationFailed: (FirebaseAuthException e) {},
                      codeSent: (String verificationId, int? resendToken) {
                        PhoneVerification.verify = verificationId;
                      },
                      codeAutoRetrievalTimeout: (String verificationId) {},
                    );
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              OtpPin(phoneNumber: countrycode.text + phone)),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: colors['primary']),
                  child: const Text(
                    'Send OTP',
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
