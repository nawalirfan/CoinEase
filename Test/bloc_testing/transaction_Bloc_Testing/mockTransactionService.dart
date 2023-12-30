import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coin_ease/models/transaction_model.dart';
import 'package:coin_ease/models/user_model.dart';
import 'package:coin_ease/services/transaction_service.dart';

class MockTransactionService implements TransactionService{
  List<TransactionModel> mockData = [];

  Future<List<TransactionModel>?> getTransactions(UserModel? user) async {
    return Future.delayed(
      Duration(seconds: 1),
      () => mockData.where((t) => t.id == user).toList(),
    );
  }

  @override
  Future<bool> createTransaction(
      UserModel? sender, UserModel receiver, double amount) async {
    await Future.delayed(Duration(seconds: 1));
    mockData.add(TransactionModel(id: '1', amount: 100, isDebit: true, account: '123456789', accountTo: {'id': '987654321'}, dateTime: Timestamp.now(), refNumber: '1234567890'));
    return true;
  }

  // Assuming you have a method to delete transactions by id or some criteria
  Future<void> deleteTransaction(String transactionId) async {
    await Future.delayed(Duration(seconds: 1));
    mockData.removeWhere((t) => t.id == transactionId);
  }

  @override
  // TODO: implement random
  Random get random => throw UnimplementedError();
}