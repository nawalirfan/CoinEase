import 'package:flutter/material.dart';
import 'package:coin_ease/colors.dart';

class SignUpForm extends StatelessWidget {
  final TextEditingController nameController;
  final TextEditingController cnicController;
  final TextEditingController dateController;
  final TextEditingController mNameController;
  final TextEditingController passwordController;
  final TextEditingController cPasswordController;
  final bool errors;
  final bool passError;

  SignUpForm({
    required this.nameController,
    required this.cnicController,
    required this.dateController,
    required this.mNameController,
    required this.passwordController,
    required this.cPasswordController,
    required this.errors,
    required this.passError,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
          if (errors)
            const Text(
              'Please fill all the fields correctly',
              style: TextStyle(
                fontSize: 18,
                color: Colors.red,
              ),
            ),
          const SizedBox(height: 10),
          buildTextField('Name:', nameController),
          const SizedBox(height: 10),
          buildTextField('CNIC Number:', cnicController, maxLength: 13),
          const SizedBox(height: 5),
          buildTextField('Date of Issuance (CNIC):', dateController),
          const SizedBox(height: 5),
          buildTextField('Mother\'s Name:', mNameController),
          const SizedBox(height: 10),
          buildTextField('Password:', passwordController, obscureText: true),
          const SizedBox(height: 10),
          buildTextField(
            'Confirm Password:',
            cPasswordController,
            errorText: passError ? 'Passwords don\'t match' : null,
          ),
        ],
      ),
    );
  }

  Widget buildTextField(
    String labelText,
    TextEditingController controller, {
    int? maxLength,
    bool obscureText = false,
    String? errorText,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          labelText,
          style: TextStyle(fontSize: 18),
        ),
        SizedBox(height: 5),
        TextField(
          controller: controller,
          maxLength: maxLength,
          obscureText: obscureText,
          decoration: InputDecoration(
            filled: true,
            contentPadding: const EdgeInsets.only(left: 10),
            fillColor: Colors.white,
            errorText: errorText,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
        ),
      ],
    );
  }
}
