import 'package:coin_ease/colors.dart';
import 'package:coin_ease/models/user_model.dart';
import 'package:coin_ease/screens/home_page.dart';
import 'package:coin_ease/services/auth_service.dart';
import 'package:coin_ease/services/transaction_service.dart';
import 'package:flutter/material.dart';

class ConfirmPayment extends StatefulWidget {
  final UserModel user;
  final double amount;

  const ConfirmPayment({Key? key, required this.amount, required this.user})
      : super(key: key);

  @override
  State<ConfirmPayment> createState() => _ConfirmPaymentState();
}

class _ConfirmPaymentState extends State<ConfirmPayment> {
  String errorMessage = '';

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
          if (errorMessage.isNotEmpty)
            Container(
              padding: const EdgeInsets.all(10),
              color: Colors.red, // Customize the color as needed
              child: Text(
                errorMessage,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 30),
            padding: const EdgeInsets.all(20),
            height: 200,
            width: 400,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: colors['secondary'],
            ),
            child: Column(
              children: [
                const Text(
                  'Confirm Payment: ',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 30),
                Text(
                  'Amount: ${widget.amount} PKR',
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  'Account Title: ${widget.user.account?.title}',
                  style: const TextStyle(fontSize: 18),
                ),
                const SizedBox(height: 10),
                Text(
                  'Account Number: ${widget.user.account?.accountNumber}',
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
                bool created = await transactionService.createTransaction(
                  sender,
                  widget.user,
                  widget.amount,
                );

                if (!created) {
                  setState(() {
                    errorMessage = 'Transaction failed: Not enough funds.';
                  });
                } else {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage()),
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: colors['primary'],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              child: const Text('Confirm'),
            ),
          ),
        ],
      ),
    );
  }
}
