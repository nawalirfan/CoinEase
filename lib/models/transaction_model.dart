import 'package:cloud_firestore/cloud_firestore.dart';

class TransactionModel {
  final String id;
  final double amount;
  final bool isDebit;
  final String account;
  final Map<String, dynamic> accountTo;
  final Timestamp dateTime;
  final String refNumber;

  TransactionModel({
    required this.id,
    required this.amount,
    required this.isDebit,
    required this.account,
    required this.accountTo,
    required this.dateTime,
    required this.refNumber,
  });

}
