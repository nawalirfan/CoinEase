import 'package:coin_ease/colors.dart';
import 'package:coin_ease/dummyData/account.dart';
import 'package:coin_ease/models/account_model.dart';
import 'package:coin_ease/models/transaction_model.dart';
import 'package:flutter/material.dart';

class TransactionDetail extends StatefulWidget {
  final TransactionModel transaction;
  final UserAccount account;
  const TransactionDetail(
      {super.key, required this.transaction, required this.account});

  @override
  State<TransactionDetail> createState() => _TransactionDetailState();
}

class _TransactionDetailState extends State<TransactionDetail> {
  late UserAccount accountDetails;

  @override
  void initState() {
    super.initState();
    accountDetails = dummyAccounts
        .firstWhere((account) => account.id == widget.transaction.accountTo);
  }

  @override
  Widget build(BuildContext context) {
    UserAccount sender =
        widget.transaction.isDebit ? widget.account : accountDetails;
    UserAccount receiver =
        widget.transaction.isDebit ? accountDetails : widget.account;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: colors['primary'],
          title: Text(
              widget.transaction.isDebit ? 'Money Debited' : 'Money Credited'),
        ),
        body: Column(
          children: [
            Container(
              width: double.infinity,
              height: 300,
              decoration: BoxDecoration(
                color: colors['secondary'],
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30)),
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
                    '${widget.transaction.isDebit ? '-' : '+'} Rs. ${widget.transaction.amount}',
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 40,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 40),
                  Text(
                    sender.title,
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'to',
                    style: TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    receiver.title,
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 50),
            Container(
              height: 300,
              margin: const EdgeInsets.all(20),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(width: 10),
                      const Text(
                        'Sender:    ',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w400),
                      ),
                      const SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            sender.title,
                            style: const TextStyle(fontSize: 20),
                          ),
                          Text(
                            sender.accountNumber,
                            style: const TextStyle(fontSize: 18),
                          ),
                          Text(
                            sender.bankName,
                            style: const TextStyle(fontSize: 18),
                          )
                        ],
                      )
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(width: 10),
                      const Text(
                        'Receiver: ',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w400),
                      ),
                      const SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            receiver.title,
                            style: const TextStyle(fontSize: 20),
                          ),
                          Text(
                            receiver.accountNumber,
                            style: const TextStyle(fontSize: 18),
                          ),
                          Text(
                            receiver.bankName,
                            style: const TextStyle(fontSize: 18),
                          )
                        ],
                      )
                    ],
                  ),
                  const SizedBox(height: 30),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(width: 10),
                      const Text(
                        'Ref. No:   ',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w400),
                      ),
                      const SizedBox(width: 10),
                      Text(
                        widget.transaction.refNumber,
                        style: const TextStyle(fontSize: 20),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
