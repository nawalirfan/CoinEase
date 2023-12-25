import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coin_ease/models/transaction_model.dart';
import 'package:coin_ease/models/user_model.dart';

class TransactionService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final Random random = Random();

  Future<List<TransactionModel>?> getTransactions(UserModel? user) async {
    try {
      DocumentReference userRef = _firestore.collection('users').doc(user?.id);

      // Initial transaction fetch
      QuerySnapshot<Map<String, dynamic>> transactionsSnapshot = await userRef
          .collection('transactions')
          .orderBy('dateTime', descending: true)
          .get();

      List<TransactionModel> transactions =
          transactionsSnapshot.docs.map((doc) {
        return TransactionModel(
          id: doc.id,
          account: doc['account'],
          amount: doc['amount'].toDouble(),
          isDebit: doc['isDebit'],
          accountTo: doc['accountTo'],
          dateTime: doc['dateTime'],
          refNumber: doc['refNumber'].toString(),
        );
      }).toList();

      // Listen for real-time updates
      userRef.collection('transactions').snapshots().listen((querySnapshot) {
        // Update the list with the latest transaction data
        List<TransactionModel> updatedTransactions =
            querySnapshot.docs.map((doc) {
          return TransactionModel(
            id: doc.id,
            account: doc['account'],
            amount: doc['amount'].toDouble(),
            isDebit: doc['isDebit'],
            accountTo: doc['accountTo'],
            dateTime: doc['dateTime'],
            refNumber: doc['refNumber'].toString(),
          );
        }).toList();

        // Order the transactions in descending order by date
        updatedTransactions.sort((a, b) => b.dateTime.compareTo(a.dateTime));

        // TODO: Update your UI or state with the ordered transactions
        print('Transactions updated in real-time: $updatedTransactions');
      });

      return transactions;
    } catch (e) {
      print('Error getting transactions: $e');
      return null;
    }
  }

  Future<bool> createTransaction(
      UserModel? sender, UserModel receiver, double amount) async {
    try {
      print(
          'in create transacr=tion: ${sender?.name}, ${receiver.name}, $amount');
      // await _firestore.runTransaction((Transaction transaction) async {
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
      if (newSenderBalance < 0) {
        throw 'you don\'t have enough money. plz receive funds from someone.';
      }
      Timestamp time = FieldValue.serverTimestamp() as Timestamp;
      await senderRef.update({'account.balance': newSenderBalance});
      await senderTransactionsRef.add({
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
      await receiverRef.update({'account.balance': newReceiverBalance});
      await receiverTransactionsRef.add({
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
      return true;
      // });
    } catch (e) {
      print("Transaction failed: $e");
      return false;
    }
  }
}
