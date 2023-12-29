import 'package:coin_ease/colors.dart';
import 'package:coin_ease/screens/auth/phone_verification.dart';
import 'package:coin_ease/screens/auth/sign_in.dart';
import 'package:coin_ease/screens/auth/sign_up.dart';
import 'package:coin_ease/services/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class OtpPin extends StatefulWidget 
{
  final String phoneNumber;

  const OtpPin({Key? key, required this.phoneNumber}) : super(key: key);

  @override
  State<OtpPin> createState() => _OtpPinState();
}

class _OtpPinState extends State<OtpPin> {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final List<TextEditingController> _otpControllers = List.generate(
    6,
    (index) => TextEditingController(),
  );
  bool wrongOTP = false;
  bool loading = false;

  void _handleVerify() async {
    final AuthService authService = AuthService();
    bool isUserSignedUp = await authService.isSignedUp(widget.phoneNumber);
    setState(() {
      loading = false;
    });
    if (isUserSignedUp) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => SignIn()),
      );
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SignUpDetails(phoneNumber: widget.phoneNumber),
        ),
      );
    }
  }

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
              const Text('Enter the code sent to your number',
                  style: TextStyle(fontSize: 16)),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(right: 30, left: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: List.generate(
                    6,
                    (index) => SizedBox(
                      width: 50,
                      child: TextFormField(
                        controller: _otpControllers[index],
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.number,
                        //obscureText: true,
                        onChanged: (value) 
                        {
                          if (wrongOTP) {
                            setState(() {
                              wrongOTP = false;
                            });
                          }
                          if (index < 5 && value.isNotEmpty) 
                          {
                            FocusScope.of(context).nextFocus();
                          }
                        },
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(
                              color: Colors.black,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(
                              color: Colors.blue,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
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
              loading
                  ? const CircularProgressIndicator()
                  : ElevatedButton(
                      onPressed: () async {
                        try {
                          String code = _otpControllers
                              .map((controller) => controller.text)
                              .join();
                          PhoneAuthCredential credential =
                              PhoneAuthProvider.credential(
                            verificationId: PhoneVerification.verify,
                            smsCode: code,
                          );
                          await auth.signInWithCredential(credential);
                          setState(() {
                            loading = false;
                          });
                          _handleVerify();
                        } catch (e) {
                          print('wrong otp: ${e}');
                          setState(() {
                            wrongOTP = true;
                            loading = false;
                          });
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: colors['primary'],
                      ),
                      child: const Text('Verify Phone Number'),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}