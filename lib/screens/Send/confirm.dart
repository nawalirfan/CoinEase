import 'package:coin_ease/colors.dart';
import 'package:coin_ease/models/user_model.dart';
import 'package:coin_ease/screens/home_page.dart';
import 'package:coin_ease/services/auth_service.dart';
import 'package:coin_ease/services/transaction_service.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ConfirmPayment extends StatelessWidget {
  final UserModel user;
  final double amount;
  const ConfirmPayment({super.key, required this.amount, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colors['primary'],
        title: const Text('Send Money'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 30),
            padding: const EdgeInsets.all(20),
            height: 200,
            width: 400,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: colors['secondary']),
            child: Column(
              children: [
                const Text(
                  'Confirm Payment: ',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 30),
                Text(
                  'Amount: $amount',
                  style: const TextStyle(
                      fontSize: 22, fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 10),
                Text(
                  'Account Title: ${user.account?.title}',
                  style: const TextStyle(fontSize: 18),
                ),
                const SizedBox(height: 10),
                Text(
                  'Account Number: ${user.account?.accountNumber}',
                  style: const TextStyle(fontSize: 18),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Container(
            padding: const EdgeInsets.only(left: 40, right: 40),
            width: double.infinity,
            child: ElevatedButton(
                onPressed: () async {
                  AuthService auth = AuthService();
                  UserModel? sender = await auth.getLoggedInUser();
                  TransactionService transactionService = TransactionService();
                  transactionService.createTransaction(sender, user, amount);

                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Transaction successful!'),
                    ),
                  );
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HomePage()));
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: colors['primary'],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    )),
                child: const Text('Confirm')),
          ),
        ],
      ),
    );
  }
}
