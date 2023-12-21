import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coin_ease/models/transaction_model.dart';

List<TransactionModel> dummyTransactions = [
  TransactionModel(
    id: 't1_user1',
    amount: 50.0,
    isDebit: true,
    account: 'a_user2',
    accountTo: {'id': 'a_user2', 'title': 'Title'},
    dateTime: Timestamp.fromDate(DateTime.parse('2023-01-01T14:30:00')),
    refNumber: 'REF1_user1',
  ),
  TransactionModel(
    id: 't2_user1',
    amount: 30.0,
    isDebit: false,
    account: 'a_user2',
    accountTo: {'id': 'a_user2', 'title': 'Title'},
    dateTime: Timestamp.fromDate(DateTime.parse('2023-01-01T14:30:00')),
    refNumber: 'REF2_user1',
  ),
  TransactionModel(
    id: 't3_user1',
    amount: 20.0,
    isDebit: true,
    account: 'a_user2',
    accountTo: {'id': 'a_user2', 'title': 'Title'},
    dateTime: Timestamp.fromDate(DateTime.parse('2023-01-01T14:30:00')),
    refNumber: 'REF3_user1',
  ),
  TransactionModel(
    id: 't4_user1',
    amount: 25.0,
    isDebit: false,
    account: 'a_user2',
    accountTo: {'id': 'a_user2', 'title': 'Title'},
    dateTime: Timestamp.fromDate(DateTime.parse('2023-01-01T14:30:00')),
    refNumber: 'REF4_user1',
  ),
  TransactionModel(
    id: '',
    amount: 50.0,
    isDebit: true,
    account: 'a_user2',
    accountTo: {'id': 'a_user2', 'title': 'Title'},
    dateTime: Timestamp.fromDate(DateTime.parse('2023-01-01T14:30:00')),
    refNumber: 'REF1_user1',
  ),
];
