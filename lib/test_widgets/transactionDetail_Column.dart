import 'package:coin_ease/colors.dart';
import 'package:coin_ease/models/account_model.dart';
import 'package:coin_ease/models/transaction_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

class TransactionDetailColumn extends StatelessWidget {
  final TransactionModel transaction;
  final UserAccount? sender;
  final UserAccount? receiver;

  TransactionDetailColumn({
    required this.transaction,
    required this.sender,
    required this.receiver,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 270,
      decoration: BoxDecoration(
        color: colors['secondary'],
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        children: [
          Image.asset(
            'assets/coin.png',
            height: 90,
            width: 90,
          ),
          Text(
            ' Rs. ${transaction.isDebit ? '-' : '+'} ${transaction.amount.toStringAsFixed(2)}',
            style: const TextStyle(
              color: Colors.black,
              fontSize: 40,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 40),
          Text(
            sender?.title ?? '',
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 10),
          const Text(
            'to',
            style: TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 10),
          Text(
            receiver?.title ?? '',
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}