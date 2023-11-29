import 'package:coin_ease/LogIn.dart';
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
    return Scaffold
    (
      //app bar
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const LogIn()),
            );
          },
        ),
        backgroundColor: const Color.fromARGB(255, 201, 200, 200),
        elevation: 0,
      ),
      body: Container(
        color: const Color.fromARGB(255, 201, 200, 200),
        child: SafeArea(
          child: Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: Text(
                    'To reset your password, please provide the following information',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                const SizedBox(height: 40.0),
                Align(
                  alignment: Alignment.center,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
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
                        ),
                      ),
                      const SizedBox(height: 10.0),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: TextField(
                          decoration: InputDecoration(
                            labelText: 'Cnic Number',
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
                      const SizedBox(height: 40.0),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: TextField(
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(
                            labelText: 'Date of Issuance',
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
                    ],
                  ),
                ),
                // Continue button at the bottom

                const SizedBox(height: 300),
                SizedBox(
                  width: 420,
                  height: 60,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const OTP1()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        primary: const Color.fromARGB(255, 157, 128, 164),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                      //continue text and arrow
                      child: const Row(
                        children: [
                          Expanded(
                            child: Center(
                              child: Text('Continue',
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.black)),
                            ),
                          ),
                          Icon(
                            Icons.arrow_forward,
                            color: Colors.black,
                          ),
                        ],
                      ),
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


//screen 2
class OTP1 extends StatelessWidget {
  const OTP1({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold
    (
      //app bar
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const OTP()),
            );
          },
        ),
        backgroundColor: const Color.fromARGB(255, 201, 200, 200),
        elevation: 0,
      ),
    );
  }
}
