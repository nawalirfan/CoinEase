import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coin_ease/models/account_model.dart';
import 'package:coin_ease/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User? get currentUser => _auth.currentUser;

  Future<UserModel?> getLoggedInUser() async {
    try {
      var querySnapshot = await FirebaseFirestore.instance
          .collection('users')
          .where('phoneNumber', isEqualTo: currentUser?.phoneNumber)
          .get();
      DocumentReference userReference = querySnapshot.docs.first.reference;
      if (querySnapshot.docs.isNotEmpty) {
        Map<String, dynamic> userData = querySnapshot.docs.first.data();
        Map<String, dynamic> accountData = userData['account'];
        print('user found: ${userData.toString()}');

        UserModel user = UserModel(
            id: querySnapshot.docs.first.id,
            phoneNumber: userData['phoneNumber'],
            password: userData['password'],
            name: userData['name'],
            cnic: userData['cnic'],
            dateOfIssuance: userData['dateOfIssuance'],
            motherName: userData['motherName'],
            account: UserAccount(
                accountNumber: accountData['accountNumber'],
                title: accountData['title'],
                balance: accountData['balance'].toDouble(),
                accountType: accountData['accountType'],
                iban: accountData['iban'],
                bankName: accountData['bankName'],
                cardNo: accountData['cardNo'],
                isActive: accountData['isActive']));
        return user;
      } else {
        throw 'Account not found';
      }
      // } else {
      //   throw 'User not found';
      // }
    } catch (e) {
      print('error while getting the user/account : $e');
      return null;
    }
  }

  Future<bool> register(UserModel user) async {
    try {
      Map<String, dynamic> accountData = {
        'accountNumber': user.phoneNumber.replaceAll('+', ''),
        'title': '${user.name} CoinEase',
        'balance': 100.0,
        'accountType': 'mastercard',
        'iban': 'PK99-COEZ-0000-${user.phoneNumber.replaceAll('+', '')}',
        'bankName': 'Coin Ease',
        'cardNo': getCardNumber(user.phoneNumber),
        'isActive': true,
      };

      Map<String, dynamic> userData = {
        'phoneNumber': user.phoneNumber,
        'password': user.password,
        'name': user.name,
        'cnic': user.cnic,
        'dateOfIssuance': user.dateOfIssuance,
        'motherName': user.motherName,
        'account': accountData
      };

      DocumentReference userRef =
          await FirebaseFirestore.instance.collection('users').add(userData);
      print(userData.toString());

      print('user account created!');
      return true;
    } catch (e) {
      print('error while registering a user: ${e}');
      return false;
    }
  }

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

  String getCardNumber(String phoneNumber) {
    String last12Digits = phoneNumber.substring(phoneNumber.length - 12);
    int number = int.parse(last12Digits);
    String transformedNumberStr = number.toString().padLeft(16, '0');

    return transformedNumberStr;
  }
}
