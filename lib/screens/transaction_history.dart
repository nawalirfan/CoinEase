import 'package:coin_ease/colors.dart';
import 'package:coin_ease/models/account_model.dart';
import 'package:coin_ease/models/transaction_model.dart';
import 'package:coin_ease/widgets/transactionsList.dart';
import 'package:flutter/material.dart';

class TransactionsAll extends StatelessWidget {
  final List<TransactionModel> transactions;
  final UserAccount account;
  const TransactionsAll(
      {super.key, required this.transactions, required this.account});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: colors['primary'],
          title: const Text('Transactions history'),
        ),
        body: SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.all(20),
          child: TransactionsList(
            transactions: transactions,
            count: transactions.length,
            account: account,
          ),
        )));
  }
}
