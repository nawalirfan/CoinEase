import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coin_ease/models/user_model.dart';
import 'package:coin_ease/models/request_model.dart';
import 'package:coin_ease/services/auth_service.dart';
import 'package:coin_ease/services/request_service.dart';

class RequestsRepository{
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<DocumentSnapshot>> getList() async {
    try {
      QuerySnapshot snapshot = await _firestore.collection('requests').get();
      print(snapshot);
      return snapshot.docs;
    } catch (e) {
      throw Exception("Error fetching list: $e");
    }
  }
}