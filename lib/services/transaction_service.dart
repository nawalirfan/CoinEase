import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coin_ease/models/transaction_model.dart';
import 'package:coin_ease/models/user_model.dart';

class TransactionService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final Random random = Random();

  Future<List<TransactionModel>?> getTransactions(UserModel? user) async {
    DocumentReference userRef = _firestore.collection('users').doc(user?.id);
    QuerySnapshot<Map<String, dynamic>> transactionsSnapshot =
        await userRef.collection('transactions').get();

    List<TransactionModel> transactions = transactionsSnapshot.docs.map((doc) {
      print('datatype of amount: ${doc['refNumber'].runtimeType}');
      return TransactionModel(
          id: doc.id,
          account: doc['account'],
          amount: doc['amount'].toDouble(),
          isDebit: doc['isDebit'],
          accountTo: doc['accountTo'],
          dateTime: doc['dateTime'],
          refNumber: doc['refNumber'].toString());
    }).toList();

    return transactions;
  }

  Future<void> createTransaction(
      UserModel? sender, UserModel receiver, double amount) async {
    try {
      await _firestore.runTransaction((Transaction transaction) async {
        // sender's acc
        DocumentReference senderRef =
            _firestore.collection('users').doc(sender?.id);
        var senderDoc = await senderRef.get();
        CollectionReference senderTransactionsRef =
            senderRef.collection('transactions');

        // receiver's acc
        DocumentReference receiverRef =
            _firestore.collection('users').doc(receiver.id);
        var receiverDoc = await receiverRef.get();

        CollectionReference receiverTransactionsRef =
            receiverRef.collection('transactions');

        int randomNumber = random.nextInt(2147483647);

        // updating sender's account
        double? currentSenderBalance = sender?.account?.balance;
        double newSenderBalance = currentSenderBalance! - amount;
        transaction.update(senderRef, {'account.balance': newSenderBalance});
        senderTransactionsRef.add({
          'amount': amount,
          'isDebit': true,
          'dateTime': FieldValue.serverTimestamp(),
          'account': senderRef.id,
          'accountTo': {
            'id': receiverRef.id,
            'title': receiverDoc['account']['title']
          },
          'refNumber': randomNumber
        });

        // updating receiver's account
        double? currentReceiverBalance = receiver.account?.balance?.toDouble();
        double newReceiverBalance = currentReceiverBalance! + amount;
        transaction
            .update(receiverRef, {'account.balance': newReceiverBalance});
        receiverTransactionsRef.add({
          'amount': amount,
          'isDebit': false,
          'dateTime': FieldValue.serverTimestamp(),
          'accountTo': {
            'id': senderRef.id,
            'title': senderDoc['account']['title']
          },
          'account': receiverRef.id,
          'refNumber': randomNumber
        });
      });
    } catch (e) {
      print("Transaction failed: $e");
    }
  }
}
