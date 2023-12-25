import 'package:coin_ease/bloc/transactions/transaction_bloc.dart';
import 'package:coin_ease/bloc/transactions/transaction_state.dart';
import 'package:coin_ease/colors.dart';
import 'package:coin_ease/models/transaction_model.dart';
import 'package:coin_ease/models/user_model.dart';
import 'package:coin_ease/screens/transaction_detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TransactionsList extends StatelessWidget {
  // final List<TransactionModel>? transactions;
  final UserModel? user;
  final int count;
  const TransactionsList({super.key, required this.user, required this.count});

  @override
  Widget build(BuildContext context) {
    List<TransactionModel>? transactions;
    return BlocBuilder<TransactionBloc, Transaction_State>(
      builder: (context, state) {
        if (state is LoadedTransactionState) {
          return _buildList(state.records);
        } else if (state is ErrorTransactionState) {
          return Center(
            child: Text(state.error),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  Widget _buildList(List<TransactionModel>? transactions) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: transactions!.length > count ? count : transactions.length,
        itemBuilder: (context, index) {
          TransactionModel transaction = transactions[index];
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
                            account: user!.account,
                          )),
                );
              },
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: colors['primary'],
                  child: Text(                    
                    (transaction.accountTo['title'] ?? '')
                        .substring(0, 1)
                        .toUpperCase(),
                    style: const TextStyle(color: Colors.white),
                  ),
                ),                
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
