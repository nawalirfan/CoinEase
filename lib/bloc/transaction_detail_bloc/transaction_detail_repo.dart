import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

class transactionDetail_Repository 
{
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<DocumentSnapshot>> getList() async {
    try {
      QuerySnapshot snapshot = await _firestore.collection('transactions').get();
      print(snapshot);
      return snapshot.docs;
    } catch (e) {
      throw Exception("Error fetching list: $e");
    }
  }

}
