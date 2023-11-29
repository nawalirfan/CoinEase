import 'package:coin_ease/LogIn.dart';
import 'package:flutter/material.dart';

//screen 1
class SignUp extends StatelessWidget 
{
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) 
  {
    return Scaffold
    (
        //App bar
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
        body: Container
        (
          color: const Color.fromARGB(255, 201, 200, 200),
          child: SafeArea
          (
            child: Column(children: 
            [
              ListView
              (
                shrinkWrap: true,
                children: 
                [
                  const SizedBox
                  (
                    height: 100,
                  ),
                  Column
                  (
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: 
                      [
                        const Padding
                        (
                          //sign up text
                          padding: EdgeInsets.only(left: 20.0),
                          child: Text(
                            'Sign Up',
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 157, 128, 164),
                            ),
                          ),
                        ),
                        const SizedBox(height: 40.0),
                        //full name text field
                        const Padding(
                          padding: EdgeInsets.only(left: 20, right: 20),
                          child: Text(
                            'Full Name',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 0, 0, 0),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          child: TextField(
                            style: const TextStyle(
                                fontSize: 15,
                                color: Color.fromARGB(255, 0, 0, 0)),
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white.withOpacity(0.3),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: const BorderSide(
                                    color: Color.fromARGB(255, 0, 0, 0)),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 15.0),
                        //cnic number text field
                        const Padding(
                          padding: EdgeInsets.only(left: 20, right: 20),
                          child: Text(
                            'CNIC number',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 0, 0, 0),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          child: TextField(
                            style: const TextStyle(
                                fontSize: 15,
                                color: Color.fromARGB(255, 0, 0, 0)),
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white.withOpacity(0.3),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: const BorderSide(
                                    color: Color.fromARGB(255, 0, 0, 0)),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 15.0),
                        //date of issuance text field
                        const Padding(
                          padding: EdgeInsets.only(left: 20, right: 20),
                          child: Text(
                            'Date of issuance',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 0, 0, 0),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          child: TextField(
                            style: const TextStyle(
                                fontSize: 15,
                                color: Color.fromARGB(255, 0, 0, 0)),
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white.withOpacity(0.3),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: const BorderSide(
                                    color: Color.fromARGB(255, 0, 0, 0)),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 15.0),
                        //father or husband name text field
                        const Padding(
                          padding: EdgeInsets.only(left: 20, right: 20),
                          child: Text(
                            'Father\'s/Husband\'s name',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 0, 0, 0),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          child: TextField(
                            style: const TextStyle(
                                fontSize: 15,
                                color: Color.fromARGB(255, 0, 0, 0)),
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white.withOpacity(0.3),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: const BorderSide(
                                    color: Color.fromARGB(255, 0, 0, 0)),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 15.0),
                        //mother name text field
                        const Padding(
                          padding: EdgeInsets.only(left: 20, right: 20),
                          child: Text(
                            'Mother\'s name',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 0, 0, 0),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          child: TextField(
                            style: const TextStyle(
                                fontSize: 15,
                                color: Color.fromARGB(255, 0, 0, 0)),
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white.withOpacity(0.3),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: const BorderSide(
                                    color: Color.fromARGB(255, 0, 0, 0)),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 100.0),
                        SizedBox
                        (
                          width: 420,
                          height: 60,
                          child: Padding
                          (
                            padding:const EdgeInsets.symmetric(horizontal: 20.0),
                            child: ElevatedButton
                            (
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const SignUp1()),
                                );
                              },
                              style: ElevatedButton.styleFrom
                              (
                                primary:
                                    const Color.fromARGB(255, 157, 128, 164),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25),
                                ),
                              ),
                              //continue text and arrow
                              child: const Row
                              (
                                children: 
                                [
                                  Expanded
                                  (
                                    child: Center(
                                      child: Text('Continue',
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.black)),
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
                      ])
                ],
              )
            ]),
          ),
        ));
  }
}

//screen 2
class SignUp1 extends StatefulWidget 
{
  const SignUp1({Key? key}) : super(key: key);

  @override
  _SignUp1State createState() => _SignUp1State();
}

class _SignUp1State extends State<SignUp1> 
{
  bool obscurePassword = true;
  bool obscureConfirmPassword = true;

  @override
  Widget build(BuildContext context) 
  {
    return Scaffold
    (
      //app bar
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const SignUp()),
            );
          },
        ),
        backgroundColor: const Color.fromARGB(255, 201, 200, 200),
        elevation: 0,
      ),
      body: Container
      (
        color: const Color.fromARGB(255, 201, 200, 200),
        child: SafeArea
        (
          child: Column
          (
            children: 
            [
              ListView
              (
                shrinkWrap: true,
                children: 
                [
                  const SizedBox
                  (
                    height: 100,
                  ),
                  Column
                  (
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: 
                    [
                      //sign up text
                      const Padding(
                        padding: EdgeInsets.only(left: 20.0),
                        child: Text(
                          'Sign Up',
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 157, 128, 164),
                          ),
                        ),
                      ),
                      const SizedBox(height: 40.0),
                      //phone number text field
                      const Padding(
                        padding: EdgeInsets.only(left: 20, right: 20),
                        child: Text(
                          'Phone Number',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 0, 0, 0),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: TextField(
                          style: const TextStyle(
                              fontSize: 15,
                              color: Color.fromARGB(255, 0, 0, 0)),
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white.withOpacity(0.3),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: const BorderSide(
                                  color: Color.fromARGB(255, 0, 0, 0)),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 40.0),
                      //nuild password text function
                      buildPasswordTextField('Password', obscurePassword),
                      const SizedBox(height: 40.0),
                      //build confirm passowrd text function
                      buildPasswordTextField('Confirm Password', obscureConfirmPassword),
                      
                      const SizedBox(height: 250),
                      //sign up button
                      SizedBox
                      (
                        width: 420,
                        height: 60,
                        child: Padding
                        (
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const LogIn()),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              primary: const Color.fromARGB(255, 157, 128, 164),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25),
                              ),
                            ),
                            child: const Text('Sign UP',
                                style: TextStyle(
                                    fontSize: 20, color: Colors.black)),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

//password and confirm password
  Widget buildPasswordTextField(String labelText, bool obscureText) 
  {
    return Column
    (
      crossAxisAlignment: CrossAxisAlignment.start,
      children: 
      [
        //text password and confirm password
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Text(
            labelText,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 0, 0, 0),
            ),
          ),
        ),
        //inside password and confirm password text field text
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: TextField(
            obscureText: obscureText,
            style: const TextStyle(
              fontSize: 15,
              color: Color.fromARGB(255, 0, 0, 0),
            ),
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white.withOpacity(0.3),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: const BorderSide(
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
              ),
              //eye icon 
              suffixIcon: GestureDetector
              (
                onTap: () {
                  setState(() {
                    if (labelText == 'Password') {
                      obscurePassword = !obscurePassword;
                    } else if (labelText == 'Confirm Password') {
                      obscureConfirmPassword = !obscureConfirmPassword;
                    }
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Icon(
                      obscureText ? Icons.visibility : Icons.visibility_off),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
