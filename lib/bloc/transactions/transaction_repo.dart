import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coin_ease/models/transaction_model.dart';
import 'package:coin_ease/models/user_model.dart';
import 'package:coin_ease/services/transaction_service.dart';

class Transaction_Repository {
  final TransactionService service = TransactionService();

  Future<List<TransactionModel>?> getTransactions(UserModel? user) async {
    return service.getTransactions(user);
  }

  Future<void> createTransaction(
      UserModel? sender, UserModel receiver, double amount) async {
    await service.createTransaction(sender, receiver, amount);
  }

  Future<void> deleteRecord(DocumentReference reference) async {
    try {
      await reference.delete();
    } catch (e) {
      throw Exception("Error deleting record: $e");
    }
  }
}
