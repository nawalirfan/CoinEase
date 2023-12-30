import 'package:flutter/material.dart';

class PhoneVerificationWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          'assets/verification.jpg',
          width: 250,
          height: 250,
        ),
        const SizedBox(height: 10),
        const Text(
          'Phone Verification',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        const Text(
          'Register your phone before getting started!',
          style: TextStyle(fontSize: 16),
        ),
      ],
    );
  }
}
