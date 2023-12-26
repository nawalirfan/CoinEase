import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coin_ease/models/request_model.dart';
import 'package:coin_ease/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RequestService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<RequestModel>?> getRequests(UserModel? user) async {
    try {
      DocumentReference userRef = _firestore.collection('users').doc(user?.id);

      QuerySnapshot<Map<String, dynamic>> requestsSnapshot = await userRef
          .collection('requests')
          .orderBy('dateTime', descending: true)
          .get();

      List<RequestModel> requests = requestsSnapshot.docs.map((doc) {
        return RequestModel(
          id: doc.id,
          amount: doc['amount'].toDouble(),
          reqfrom: doc['reqFrom'],
          dateTime: doc['dateTime'],
          message: doc['message'],
        );
      }).toList();

      // Listen for real-time updates
      userRef.collection('requests').snapshots().listen((querySnapshot) {
        List<RequestModel> updatedRequests = querySnapshot.docs.map((doc) {
          return RequestModel(
            id: doc.id,
            amount: doc['amount'].toDouble(),
            reqfrom: doc['reqFrom'],
            dateTime: doc['dateTime'],
            message: doc['message'],
          );
        }).toList();

        updatedRequests.sort((a, b) => b.dateTime.compareTo(a.dateTime));

        print('Requests updated in real-time: $updatedRequests');
      });

      return requests;
    } catch (e) {
      print('Error getting transactions: $e');
      return null;
    }
  }

  Future<bool> createRequest(UserModel? requestFrom, UserModel requestTo,
      double amount, String message) async {
    try {
      // sender's acc
      DocumentReference fromRef =
          _firestore.collection('users').doc(requestFrom?.id);
      var reqFromDoc = await fromRef.get();
      // CollectionReference fromRequestRef =
      //     fromRef.collection('requests');

      // receiver's acc
      DocumentReference toRef =
          _firestore.collection('users').doc(requestTo.id);
      // var reqToDoc = await toRef.get();

      CollectionReference toRequestRef = toRef.collection('requests');

      // updating receiver's account
      await toRequestRef.add({
        'amount': amount,
        'dateTime': FieldValue.serverTimestamp(),
        'reqFrom': {'id': fromRef.id, 'title': reqFromDoc['account']['title']},
        'message': message,
      });

      return true;
    } catch (e) {
      print("Request failed: $e");
      return false;
    }
  }

  Future<bool> deleteRequest(String requestId, String reqTo) async {
    try {      
      DocumentReference userRef = _firestore.collection('users').doc(reqTo);
      CollectionReference requestsRef = userRef.collection('requests');

      DocumentReference requestRef = requestsRef.doc(requestId);

      var requestDoc = await requestRef.get();
      if (!requestDoc.exists) {
        throw 'Request not found';
      }

      await requestRef.delete();

      return true;
    } catch (e) {
      print('Error deleting request: $e');
      return false;
    }
  }
}
