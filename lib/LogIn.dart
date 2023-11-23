import 'package:flutter/material.dart';



class LogIn extends StatefulWidget 
{
  const LogIn({Key? key}) : super(key: key);

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> 
{
  @override
  Widget build(BuildContext context) 
  {
    return Scaffold
    (
      body: Container
      (
        //Background color
        color: const Color.fromARGB(255, 201, 200, 200),
        child: SafeArea
        (
          child: Center
          (
            child: ListView
            (
              shrinkWrap: true,
              children: 
              [
                Column
                (
                  mainAxisAlignment: MainAxisAlignment.start, 
                  crossAxisAlignment: CrossAxisAlignment.start, 
                  children: 
                  [
                    //login text 
                    const Padding
                    (
                      padding:  EdgeInsets.only(top: 20.0, left: 20.0),
                      child: Text
                      (
                        'Log In',
                        style: TextStyle
                        (
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color:  Color.fromARGB(255, 157, 128, 164),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    //Email Text Field + phone icon
                    Padding
                    (
                      padding: const EdgeInsets.only(right: 20.0, left: 20.0),
                      child: TextField(
                        style: TextStyle(color: Colors.white.withOpacity(0.9)),
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.phone),
                          labelText: 'Phone Number',
                          filled: true,
                          fillColor: Colors.white.withOpacity(0.3), 
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: const BorderSide(color: Color.fromARGB(255, 3, 3, 3)), 
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    //Password + lock icon
                    Padding
                    (
                      padding: const EdgeInsets.only(right: 20.0, left: 20.0),
                      child: TextField
                      (
                        obscureText: true,
                        style: const TextStyle(fontSize: 18, color: Color.fromARGB(255, 0, 0, 0)),
                        decoration: InputDecoration
                        (
                          prefixIcon: const Icon(Icons.lock), 
                          labelText: 'Password',
                          filled: true,
                          fillColor: Colors.white.withOpacity(0.3), 
                          border: OutlineInputBorder
                          (
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: const BorderSide(color: Color.fromARGB(255, 0, 0, 0)),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 30.0),
                    //sign in button
                    SizedBox
                    (
                      width: 420,
                      height: 60,
                      child: Padding
                      (
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: ElevatedButton
                        (
                          onPressed: () {},
                          style: ElevatedButton.styleFrom
                          (
                            primary: const Color.fromARGB(255, 157, 128, 164),
                            shape: RoundedRectangleBorder
                            (
                              borderRadius: BorderRadius.circular(25),
                            ),
                          ),
                          child: const Text('Sign In', style: TextStyle(fontSize: 20)),
                        ),
                      ),
                    ),
                    const SizedBox(height: 30.0),
                    //dont have an account + sign up text button
                    Row
                    (
                      children:
                      [
                        const Padding
                        (
                          padding:  EdgeInsets.only(left: 20.0),
                          child: Text
                          (
                            "Don't have an account?",
                            style: TextStyle(fontSize: 17, color: Color.fromARGB(255, 0, 0, 0)),
                          ),
                        ),
                        TextButton
                        (
                          onPressed: () {},
                          child: const Text
                          (
                            'Sign Up',
                            style: TextStyle(fontSize: 17),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10.0),
                    //forget password
                    Row
                    (
                      children: 
                      [
                        Padding
                        (
                          padding: const EdgeInsets.only(left: 20.0),
                          child: TextButton
                          (
                            onPressed: () {},
                            child: const Text
                            (
                              'Forgot Password?',
                              style: TextStyle(fontSize: 17),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}