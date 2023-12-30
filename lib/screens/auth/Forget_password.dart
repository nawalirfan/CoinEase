import 'package:flutter/material.dart';
import 'package:coin_ease/widgets/passwordResetForm.dart';
import 'package:coin_ease/screens/auth/sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({Key? key}) : super(key: key);

  @override
  _ForgetPasswordState createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  TextEditingController passwordController = TextEditingController();
  TextEditingController cpasswordController = TextEditingController();
  TextEditingController cnicController = TextEditingController();
  bool passError = false;
  bool errors = false;
  bool cnicError = false;

  CollectionReference userCollection =
      FirebaseFirestore.instance.collection('users');
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<User?> getCurrentUser() async {
    return _auth.currentUser;
  }

  Future<void> forgetPassword(String cnic, String password) async {
    try {
      User? currentUser = await getCurrentUser();
      if (currentUser != null) {
        var querySnapshot = await FirebaseFirestore.instance
            .collection('users')
            .where('phoneNumber', isEqualTo: currentUser.phoneNumber)
            .get();
        var userDocument = querySnapshot.docs.first;

        if (userDocument.exists) {
          String currentUserCNIC = userDocument['cnic'];

          if (currentUserCNIC == cnic) {
            await userCollection.doc(userDocument.id).update({
              'password': password,
            });

            print('Password updated successfully');

            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => SignIn(),
              ),
            );
          } else {
            print('CNIC number is invalid for the current user');
            setState(() {
              errors = true;
              cnicError = true;
            });
          }
        } else {
          print('User not found with the provided UID');
          setState(() {
            errors = true;
          });
        }
      } else {
        print('No user is currently logged in');
      }
    } catch (e) {
      print('Error updating password: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return PasswordResetForm(
      forgetPasswordFunction: forgetPassword,
      cnicError: cnicError,

    );
  }
}
