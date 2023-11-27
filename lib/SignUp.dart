import 'package:flutter/material.dart';

class SignUp extends StatelessWidget 
{
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) 
  {
    return Scaffold
    (
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
                      const Padding
                      (
                        padding: EdgeInsets.only(left: 20.0),
                        child: Text
                        (
                          'Sign Up',
                          style: TextStyle
                          (
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 157, 128, 164),
                          ),
                        ),
                      ),
                      const SizedBox(height: 40.0),
                      const Padding
                      (
                        padding: EdgeInsets.only(left: 20, right: 20),
                        child: Text
                        (
                          'Full Name',
                          style: TextStyle
                          (
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 0, 0, 0),
                          ),
                        ),
                      ),
                      Padding
                      (
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: TextField
                        (
                          
                          style: const TextStyle
                          (
                            fontSize: 15, color: Color.fromARGB(255, 0, 0, 0)
                          ),
                          decoration: InputDecoration
                          (
                            filled: true,
                            fillColor: Colors.white.withOpacity(0.3),
                            border: OutlineInputBorder
                            (
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: const BorderSide
                              (
                                color: Color.fromARGB(255, 0, 0, 0)
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 15.0),
                      const Padding
                      (
                        padding: EdgeInsets.only(left: 20, right: 20),
                        child: Text
                        (
                          'CNIC number',
                          style: TextStyle
                          (
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 0, 0, 0),
                          ),
                        ),
                      ),
                      Padding
                      (
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: TextField
                        (
                          
                          style: const TextStyle
                          (
                            fontSize: 15, color: Color.fromARGB(255, 0, 0, 0)
                          ),
                          decoration: InputDecoration
                          (
                            filled: true,
                            fillColor: Colors.white.withOpacity(0.3),
                            border: OutlineInputBorder
                            (
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: const BorderSide
                              (
                                color: Color.fromARGB(255, 0, 0, 0)
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 15.0),
                      const Padding
                      (
                        padding: EdgeInsets.only(left: 20, right: 20),
                        child: Text
                        (
                          'Date of issuance',
                          style: TextStyle
                          (
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 0, 0, 0),
                          ),
                        ),
                      ),
                   
                      Padding
                      (
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: TextField
                        (
                          
                          style: const TextStyle
                          (
                            fontSize: 15, color: Color.fromARGB(255, 0, 0, 0)
                          ),
                          decoration: InputDecoration
                          (
                            filled: true,
                            fillColor: Colors.white.withOpacity(0.3),
                            border: OutlineInputBorder
                            (
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: const BorderSide
                              (
                                color: Color.fromARGB(255, 0, 0, 0)
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 15.0),
                      const Padding
                      (
                        padding: EdgeInsets.only(left: 20, right: 20),
                        child: Text
                        (
                          'Father\'s/Husband\'s name',
                          style: TextStyle
                          (
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 0, 0, 0),
                          ),
                        ),
                      ),
                   
                      Padding
                      (
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: TextField
                        (
                          
                          style: const TextStyle
                          (
                            fontSize: 15, color: Color.fromARGB(255, 0, 0, 0)
                          ),
                          decoration: InputDecoration
                          (
                            filled: true,
                            fillColor: Colors.white.withOpacity(0.3),
                            border: OutlineInputBorder
                            (
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: const BorderSide
                              (
                                color: Color.fromARGB(255, 0, 0, 0)
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 15.0),
                      const Padding
                      (
                        padding: EdgeInsets.only(left: 20, right: 20),
                        child: Text
                        (
                          'Mother\'s name',
                          style: TextStyle
                          (
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 0, 0, 0),
                          ),
                        ),
                      ),
                   
                      Padding
                      (
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: TextField
                        (
                          
                          style: const TextStyle
                          (
                            fontSize: 15, color: Color.fromARGB(255, 0, 0, 0)
                          ),
                          decoration: InputDecoration
                          (
                            filled: true,
                            fillColor: Colors.white.withOpacity(0.3),
                            border: OutlineInputBorder
                            (
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: const BorderSide
                              (
                                color: Color.fromARGB(255, 0, 0, 0)
                              ),
                            ),
                          ),
                        ),
                      ), 
                      const SizedBox(height: 15.0),
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
                            child: const Text('Continue', style: TextStyle(fontSize: 20, color: Colors.black)),
                          ),
                        ),
                      ),
                    ]
                  )
                ],
              )
            ]
          ),
        ),
      )
    );
  }
}
