import 'package:coin_ease/bloc/transactions/transaction_bloc.dart';
import 'package:coin_ease/bloc/transactions/transaction_state.dart';
import 'package:coin_ease/models/transaction_model.dart';
import 'package:coin_ease/models/user_model.dart';
import 'package:coin_ease/screens/transaction_detail.dart';
import 'package:coin_ease/test_widgets/transactionList/transactionList_Tile.dart';
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
        return TransactionTile(
          title: transaction.accountTo['title'] ?? '',
          amount: transaction.amount,
          isDebit: transaction.isDebit,
          dateTime: transaction.dateTime.toDate().toString(),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => TransactionDetail(
                  transaction: transaction,
                  account: user!.account,
                ),
              ),
            );
          },
        );
      },
    );
  }
}
