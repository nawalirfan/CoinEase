import 'package:flutter/material.dart';

class PasswordResetForm extends StatefulWidget {
  final Function(String, String) forgetPasswordFunction;

  PasswordResetForm({required this.forgetPasswordFunction, Key? key})
      : super(key: key);

  @override
  _PasswordResetFormState createState() => _PasswordResetFormState();
}

class _PasswordResetFormState extends State<PasswordResetForm> {
  TextEditingController cnicController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController cpasswordController = TextEditingController();
  bool errors = false;
  bool passError = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView(
          shrinkWrap: true,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 20.0, left: 20.0),
                  child: Text(
                    'CNIC Number',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 47, 156, 138),
                    ),
                  ),
                ),
                const SizedBox(height: 10.0),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: TextField(
                    controller: cnicController,
                    style: const TextStyle(
                      fontSize: 18,
                      color: Color.fromARGB(255, 0, 0, 0),
                    ),
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.email),
                      filled: true,
                      fillColor: Colors.white,
                      errorText: errors && cnicController.text.isEmpty
                          ? 'CNIC number is required'
                          : errors
                              ? 'Invalid CNIC number'
                              : null,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 20.0, left: 20.0),
                  child: Text(
                    'Enter Password',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 47, 156, 138),
                    ),
                  ),
                ),
                const SizedBox(height: 10.0),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: TextField(
                    controller: passwordController,
                    obscureText: true,
                    style: const TextStyle(
                      fontSize: 18,
                      color: Color.fromARGB(255, 0, 0, 0),
                    ),
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.lock),
                      filled: true,
                      fillColor: Colors.white,
                      errorText: errors && passwordController.text.isEmpty
                          ? 'Password is required'
                          : null,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 20.0, left: 20.0),
                  child: Text(
                    'Confirm Password',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 47, 156, 138),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: TextField(
                    controller: cpasswordController,
                    obscureText: true,
                    style: const TextStyle(
                      fontSize: 18,
                      color: Color.fromARGB(255, 0, 0, 0),
                    ),
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.lock),
                      filled: true,
                      fillColor: Colors.white,
                      errorText: errors && cpasswordController.text.isEmpty
                          ? 'Confirm Password is required'
                          : passError
                              ? 'Confirm Passwords don\'t match'
                              : null,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10.0),
                SizedBox(
                  width: 420,
                  height: 60,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: ElevatedButton(
                      onPressed: () async {
                        setState(() {
                          passError =
                              passwordController.text != cpasswordController.text;
                        });

                        if (!passError) {
                          print(cnicController.text);
                          if (cnicController.text.isEmpty) {
                            setState(() {
                              errors = true;
                            });
                          } else {
                            widget.forgetPasswordFunction(
                                cnicController.text, passwordController.text);
                            if (errors) {
                              // Show error below the CNIC TextField
                              setState(() {
                                errors = true;
                              });
                            }
                          }
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 47, 156, 138),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                      child: const Text('Continue',
                          style: TextStyle(fontSize: 20)),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
