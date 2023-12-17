import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coin_ease/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User? get currentUser => _auth.currentUser;

  Future<bool> isSignedUp(String phone) async {
    try {
      var userCollection = FirebaseFirestore.instance.collection('users');
      var querySnapshot =
          await userCollection.where('phoneNumber', isEqualTo: phone).get();
      return querySnapshot.docs.isNotEmpty;
    } catch (e) {
      print('error while checking user is signed up: ${e}');
      return false;
    }
  }

  Future<UserModel?> signIn(String password) async {
    String? phoneNumber = currentUser?.phoneNumber;
    print('in signIn fiunction: ${phoneNumber} ${password}');
    if (phoneNumber != null) {
      try {
        QuerySnapshot querySnapshot = await FirebaseFirestore.instance
            .collection('users')
            .where('phoneNumber', isEqualTo: phoneNumber)
            .get();

        if (querySnapshot.docs.isNotEmpty) {
          DocumentSnapshot userDocument = querySnapshot.docs.first;
          Map<String, dynamic> userData =
              userDocument.data() as Map<String, dynamic>;
          String storedPassword = userData['password'];

          if (password == storedPassword) {
            UserModel user = UserModel(
              id: userDocument.id,
              phoneNumber: userData['phoneNumber'],
              password: userData['password'],
              name: userData['name'],
              cnic: userData['cnic'],
              dateOfIssuance: userData['dateOfIssuance'],
              motherName: userData['motherName'],
            );
            return user;
          } else {
            print('Incorrect password');
            return null;
          }
        } else {
          print('No user found for the provided phone number.');
          return null;
        }
      } catch (e) {
        print('Error querying Firestore: $e');
        return null;
      }
    } else {
      // Current user phone number is null
      print('Current user phone number is null.');
      return null;
    }
  }
}
