import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

class HomePageRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<DocumentSnapshot>> getList() async {
    try {
      QuerySnapshot snapshot = await _firestore.collection('users').get();
      print(snapshot);
      return snapshot.docs;
    } catch (e) {
      throw Exception("Error fetching list: $e");
    }
  }

  Future<void> deleteRecord(DocumentReference reference) async {
    try {
      await reference.delete();
    } catch (e) {
      throw Exception("Error deleting record: $e");
    }
  }
}
