import 'package:coin_ease/LogIn.dart';
import 'package:flutter/material.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            child: Column(children: [
              ListView(
                shrinkWrap: true,
                children: [
                  const SizedBox(
                    height: 100,
                  ),
                  Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
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
                        const SizedBox(height: 150.0),
                        SizedBox(
                          width: 420,
                          height: 60,
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 20.0),
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const SignUp1()),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                primary:
                                    const Color.fromARGB(255, 157, 128, 164),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25),
                                ),
                              ),
                              child: Row(
                                children: [
                                  Expanded(
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

class SignUp1 extends StatefulWidget {
  const SignUp1({Key? key}) : super(key: key);

  @override
  _SignUp1State createState() => _SignUp1State();
}

class _SignUp1State extends State<SignUp1> {
  bool obscurePassword = true;
  bool obscureConfirmPassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: Container(
        color: const Color.fromARGB(255, 201, 200, 200),
        child: SafeArea(
          child: Column(
            children: [
              ListView(
                shrinkWrap: true,
                children: [
                  SizedBox(
                    height: 100,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
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
                      buildPasswordTextField('Password', obscurePassword),
                      const SizedBox(height: 40.0),
                      buildPasswordTextField(
                          'Confirm Password', obscureConfirmPassword),
                      SizedBox(height: 250),
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

  Widget buildPasswordTextField(String labelText, bool obscureText) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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
              suffixIcon: GestureDetector(
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
