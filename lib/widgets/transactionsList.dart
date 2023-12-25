import 'package:coin_ease/colors.dart';
import 'package:coin_ease/models/account_model.dart';
import 'package:coin_ease/models/transaction_model.dart';
import 'package:coin_ease/screens/transaction_detail.dart';
import 'package:flutter/material.dart';

class TransactionsList extends StatelessWidget {
  final List<TransactionModel>? transactions;
  final UserAccount? account;
  final int count;
  const TransactionsList(
      {super.key,
      required this.transactions,
      required this.count,
      this.account});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: transactions!.length > count ? count : transactions?.length,
        itemBuilder: (context, index) {
          TransactionModel transaction = transactions![index];
          return Container(
            margin: const EdgeInsets.only(top: 5, bottom: 5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: colors['secondary'],
            ),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => TransactionDetail(
                            transaction: transaction,
                            account: account,
                          )),
                );
              },
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: colors['primary'],
                  child: Text(
                    //change it to account title's initial
                    (transaction.accountTo['title'] ?? '')
                        .substring(0, 1)
                        .toUpperCase(),
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
                //change it to account title
                title: Text(transaction.accountTo['title'] ?? ''),
                subtitle: Text(transaction.dateTime.toDate().toString()),
                trailing: Text(
                  '${transaction.isDebit ? '-' : '+'} Rs. ${transaction.amount}',
                  style: TextStyle(
                      color: transaction.isDebit
                          ? const Color.fromARGB(255, 199, 33, 21)
                          : const Color.fromARGB(255, 9, 129, 79),
                      fontSize: 15,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ),
          );
        });
  }
}
