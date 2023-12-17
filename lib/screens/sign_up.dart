import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coin_ease/colors.dart';
import 'package:coin_ease/models/user_model.dart';
import 'package:coin_ease/screens/sign_in.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class SignUpDetails extends StatefulWidget {
  final String phoneNumber;
  const SignUpDetails({super.key, required this.phoneNumber});

  @override
  State<SignUpDetails> createState() => _SignUpDetailsState();
}

class _SignUpDetailsState extends State<SignUpDetails> {
  TextEditingController nameController = TextEditingController();
  TextEditingController cnicController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController mNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController cPasswordController = TextEditingController();

  void saveUser() {
    // UserModel user = UserModel(id: id, phoneNumber: widget.phoneNumber, password: passwordController.text, name: nameController.text, cnic: cnicController.text, dateOfIssuance: dateController.text, motherName: mNameController.text)
    Map<String, dynamic> userData = {
      'phoneNumber': widget.phoneNumber,
      'password': passwordController.text,
      'name': nameController.text,
      'cnic': cnicController.text,
      'dateOfIssuance': dateController.text,
      'motherName': mNameController.text
    };
    if (passwordController.text == cPasswordController.text) {
      FirebaseFirestore.instance.collection('users').add(userData);
      print('user created!');
    } else {
      print('error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colors['primary'],
        leading: const Icon(Icons.arrow_back),
        title: const Text('Personal Details'),
      ),
      body: Container(
        padding:
            const EdgeInsets.only(top: 30, bottom: 30, right: 30, left: 30),
        child: SingleChildScrollView(
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
              const Text(
                'Name: ',
                style: TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 5),
              TextField(
                controller: nameController,
                decoration: InputDecoration(
                    filled: true,
                    contentPadding: const EdgeInsets.symmetric(vertical: 10),
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    )),
              ),
              const SizedBox(height: 10),
              const Text(
                'CNIC Number: ',
                style: TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 5),
              TextField(
                controller: cnicController,
                maxLength: 13,
                decoration: InputDecoration(
                    filled: true,
                    contentPadding: const EdgeInsets.symmetric(vertical: 10),
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    )),
              ),
              const SizedBox(height: 5),
              const Text(
                'Date of Issuance (CNIC): ',
                style: TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 5),
              TextField(
                controller: dateController,
                decoration: InputDecoration(
                    filled: true,
                    contentPadding: const EdgeInsets.symmetric(vertical: 10),
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    )),
              ),
              const SizedBox(height: 10),
              const Text(
                'Mother\'s Name: ',
                style: TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 5),
              TextField(
                controller: mNameController,
                decoration: InputDecoration(
                    filled: true,
                    contentPadding: const EdgeInsets.symmetric(vertical: 10),
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    )),
              ),
              const SizedBox(height: 10),
              const Text(
                'Password: ',
                style: TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 5),
              TextField(
                controller: passwordController,
                decoration: InputDecoration(
                    filled: true,
                    contentPadding: const EdgeInsets.symmetric(vertical: 10),
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    )),
              ),
              const SizedBox(height: 10),
              const Text(
                'Confirm Password: ',
                style: TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 5),
              TextField(
                controller: cPasswordController,
                decoration: InputDecoration(
                    filled: true,
                    contentPadding: const EdgeInsets.symmetric(vertical: 10),
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    )),
              ),
              const SizedBox(height: 40),
              SizedBox(
                height: 60,
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () {
                      saveUser();
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignIn()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: colors['primary'],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Register',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        Icon(Icons.arrow_forward)
                      ],
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
