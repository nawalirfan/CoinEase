import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class OTP extends StatefulWidget {
  const OTP({Key? key}) : super(key: key);

  @override
  State<OTP> createState() => _OTPState();
}

class _OTPState extends State<OTP> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color.fromARGB(255, 201, 200, 200),
        child: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Container(
                        child: IntlPhoneField(
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(
                            labelText: 'Phone Number',
                            filled: true,
                            fillColor: Colors.white.withOpacity(0.3),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: const BorderSide(
                                color: Color.fromARGB(255, 3, 3, 3),
                              ),
                            ),
                          ),
                          initialCountryCode: 'PK',
                          onChanged: (phone) {
                            print(phone.completeNumber);
                          },
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 420,
                  height: 60,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        primary: const Color.fromARGB(255, 157, 128, 164),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                      child:
                          const Text('Sign In', style: TextStyle(fontSize: 20)),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
