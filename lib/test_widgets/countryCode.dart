import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_field/phone_number.dart';

class CustomPhoneField extends StatelessWidget {
  final void Function(PhoneNumber)? onChanged;
  final String initialCountryCode;

  CustomPhoneField({
    required this.onChanged,
    required this.initialCountryCode,
  });

  @override
  Widget build(BuildContext context) {
    return IntlPhoneField(
      onChanged: onChanged,
      initialCountryCode: initialCountryCode,
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
    );
  }
}
