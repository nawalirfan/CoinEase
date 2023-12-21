import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coin_ease/models/account_model.dart';
import 'package:coin_ease/models/user_model.dart';

class UserService {
  final userCollection = FirebaseFirestore.instance.collection('users');

  Future<UserModel?> getUser(String? phoneNumber) async {
    try {
      var querySnapshot = await userCollection
          .where('phoneNumber', isEqualTo: phoneNumber)
          .get();
      DocumentReference userReference = querySnapshot.docs.first.reference;
      if (querySnapshot.docs.isNotEmpty) {
        Map<String, dynamic> userData = querySnapshot.docs.first.data();
        Map<String, dynamic> accountData = userData['account'];
        print('user found: ${userData.toString()}');

        print(
            'type of balance: ${accountData['balance'].toDouble().runtimeType}');

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
                balance: accountData['balance']?.toDouble(),
                accountType: accountData['accountType'],
                iban: accountData['iban'],
                bankName: accountData['bankName'],
                cardNo: accountData['cardNo'],
                isActive: accountData['isActive']));
        return user;
      } else {
        throw 'Account not found';
      }
    } catch (e) {
      print('error while getting the user/account in this fn: $e');
      return null;
    }
  }

  Future<List<UserModel>?> getUsers(String val) async {
    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('users')
          .where(Filter.or(
              Filter('account.title', isEqualTo: val),
              Filter('account.iban', isEqualTo: val),
              Filter('account.accountNumber', isEqualTo: val)))
          .get();

      List<UserModel>? usersList = querySnapshot.docs.map((doc) {
        return UserModel(
            id: doc.id,
            phoneNumber: doc['phoneNumber'],
            password: doc['password'],
            name: doc['name'],
            cnic: doc['cnic'],
            dateOfIssuance: doc['dateOfIssuance'],
            motherName: doc['motherName'],
            account: UserAccount.fromJson(doc['account']));
      }).toList();
      return usersList;
    } catch (e) {
      print('error while getting users: $e');
      return null;
    }
  }

  Future<UserModel?> getUserById(String? id) async {
  try {
    var documentSnapshot = await userCollection.doc(id).get();
    
    if (documentSnapshot.exists) {
      Map<String, dynamic> userData = documentSnapshot.data() as Map<String, dynamic>;
      Map<String, dynamic> accountData = userData['account'];

      print('user found: ${userData.toString()}');

      UserModel user = UserModel(
        id: documentSnapshot.id,
        phoneNumber: userData['phoneNumber'],
        password: userData['password'],
        name: userData['name'],
        cnic: userData['cnic'],
        dateOfIssuance: userData['dateOfIssuance'],
        motherName: userData['motherName'],
        account: UserAccount(
          accountNumber: accountData['accountNumber'],
          title: accountData['title'],
          balance: accountData['balance']?.toDouble(),
          accountType: accountData['accountType'],
          iban: accountData['iban'],
          bankName: accountData['bankName'],
          cardNo: accountData['cardNo'],
          isActive: accountData['isActive'],
        ),
      );

      return user;
    } else {
      throw 'Account not found';
    }
  } catch (e) {
    print('error while getting the user/account in this fn: $e');
    return null;
  }
}


}
