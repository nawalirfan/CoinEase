import 'package:coin_ease/screens/auth/Forget_password.dart';
import 'package:coin_ease/screens/auth/phone_verification.dart';
import 'package:flutter/material.dart';
import 'package:coin_ease/colors.dart';


class AuthLinksRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const Padding(
              padding:  EdgeInsets.only(left: 20.0),
              child: Text(
                "Don't have an account?",
                style: TextStyle(
                  fontSize: 17,
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
              ),
            ),
            const SizedBox(width: 10), 
           //const  CircularProgressIndicator(), 
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const PhoneVerification(),
                  ),
                );
              },
              child: Text(
                'Sign Up',
                style: TextStyle(
                  fontSize: 17,
                  color: colors['primary'],
                ),
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
                      builder: (context) => const ForgetPassword(),
                    ),
                  );
                },
                child: Text(
                  'Forgot Password?',
                  style: TextStyle(
                    fontSize: 17,
                    color: colors['primary'],
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
