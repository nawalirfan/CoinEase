import 'package:coin_ease/colors.dart';
import 'package:coin_ease/screens/auth/phone_verification.dart';
import 'package:coin_ease/screens/auth/sign_in.dart';
import 'package:coin_ease/screens/auth/sign_up.dart';
import 'package:coin_ease/services/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class OtpPin extends StatefulWidget {
  final String phoneNumber;
  const OtpPin({super.key, required this.phoneNumber});

  @override
  State<OtpPin> createState() => _OtpPinState();
}

class _OtpPinState extends State<OtpPin> {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final TextEditingController _pinEditingController = TextEditingController();
  bool wrongOTP = false;

  void _handleVerify() async {
    final AuthService authService = AuthService();
    bool isUserSignedUp = await authService.isSignedUp(widget.phoneNumber);
    if (isUserSignedUp) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => SignIn()));
    } else {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  SignUpDetails(phoneNumber: widget.phoneNumber)));
    }
  }

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: const TextStyle(
        fontSize: 20,
        color: Color.fromRGBO(30, 60, 87, 1),
        fontWeight: FontWeight.w600,
      ),
      decoration: BoxDecoration(
        border: Border.all(color: Color.fromARGB(255, 233, 198, 241)),
        borderRadius: BorderRadius.circular(20),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: Color.fromARGB(255, 117, 95, 122)),
      borderRadius: BorderRadius.circular(20),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration?.copyWith(
        color: const Color.fromRGBO(234, 239, 243, 1),
      ),
    );

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
              const Text('Enter the code sent to your number',
                  style: TextStyle(fontSize: 16)),
              const SizedBox(height: 20),
              Padding(
                padding: EdgeInsets.only(right: 30, left: 30),
                child: Pinput(
                  length: 6,
                  defaultPinTheme: defaultPinTheme,
                  focusedPinTheme: focusedPinTheme,
                  submittedPinTheme: submittedPinTheme,
                  pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                  showCursor: true,
                  controller: _pinEditingController,
                  onChanged: (value) {
                    if (wrongOTP) {
                      setState(() {
                        wrongOTP = false;
                      });
                    }
                  },
                ),
              ),
              if (wrongOTP)
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    'Wrong OTP entered. Please try again.',
                    style: TextStyle(
                      color: Colors.red,
                    ),
                  ),
                ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () async {
                    try {
                      String code = _pinEditingController.text;
                      PhoneAuthCredential credential =
                          PhoneAuthProvider.credential(
                        verificationId: PhoneVerification.verify,
                        smsCode: code,
                      );                      
                          await auth.signInWithCredential(credential);
                      _handleVerify();
                    } catch (e) {
                      print('wrong otp: ${e}');
                      setState(() {
                        wrongOTP = true;
                      });
                    }
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: colors['primary']),
                  child: const Text(
                    'Verify Phone Number',
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
