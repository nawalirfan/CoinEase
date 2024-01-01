import 'package:coin_ease/screens/auth/Forget_password.dart';
import 'package:flutter/material.dart';
import 'package:coin_ease/colors.dart';

class AuthLinksRow extends StatelessWidget {
  const AuthLinksRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
