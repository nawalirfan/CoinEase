import 'package:cloud_firestore/cloud_firestore.dart';

class HomePage_Repository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<DocumentSnapshot>> getList() async {
    try {
      QuerySnapshot snapshot = await _firestore.collection('users').get();
      print(snapshot);
      return snapshot.docs;
    } catch (e) {
      throw Exception("Error fetching Data: $e");
    }
  }

}
