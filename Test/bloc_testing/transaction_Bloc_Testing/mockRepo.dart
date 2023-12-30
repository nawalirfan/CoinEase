import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coin_ease/bloc/transactions/transaction_repo.dart';
import 'package:coin_ease/models/transaction_model.dart';
import 'package:coin_ease/models/user_model.dart';

import 'mockTransactionService.dart';

class MockTransactionRepository implements Transaction_Repository {
  @override
  final MockTransactionService service = MockTransactionService();

  Future<List<TransactionModel>?> getTransactions(UserModel? user) async {
    return service.getTransactions(user);
  }

  Future<void> createTransaction(
      UserModel? sender, UserModel receiver, double amount) async {
    await service.createTransaction(sender, receiver, amount);
  }

  Future<void> deleteTransaction(String transactionId) async {
    await service.deleteTransaction(transactionId);
  }

  @override
  Future<void> deleteRecord(DocumentReference<Object?> reference) {
    // TODO: implement deleteRecord
    throw UnimplementedError();
  }
}