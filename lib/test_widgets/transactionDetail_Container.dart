import 'package:flutter/material.dart';
import 'package:coin_ease/models/account_model.dart';
import 'package:coin_ease/models/transaction_model.dart';

class TransactionDetailsContainer extends StatelessWidget {
  final UserAccount? sender;
  final UserAccount? receiver;
  final TransactionModel transaction;

  TransactionDetailsContainer({
    required this.sender,
    required this.receiver,
    required this.transaction,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      margin: const EdgeInsets.only(top: 20, bottom: 10, left: 20, right: 20),
      padding: const EdgeInsets.all(10),
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
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
              ),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    sender?.title ?? '',
                    style: const TextStyle(fontSize: 18),
                  ),
                  Text(
                    sender?.accountNumber ?? '',
                    style: const TextStyle(fontSize: 18),
                  ),
                  Text(
                    sender?.bankName ?? '',
                    style: const TextStyle(fontSize: 18),
                  )
                ],
              )
            ],
          ),
          const SizedBox(height: 20),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(width: 10),
              const Text(
                'Receiver: ',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
              ),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    receiver?.title ?? '',
                    style: const TextStyle(fontSize: 18),
                  ),
                  Text(
                    receiver?.accountNumber ?? '',
                    style: const TextStyle(fontSize: 18),
                  ),
                  Text(
                    receiver?.bankName ?? '',
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
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
              ),
              const SizedBox(width: 10),
              Text(
                transaction.refNumber,
                style: const TextStyle(fontSize: 18),
              )
            ],
          ),
        ],
      ),
    );
  }
}
