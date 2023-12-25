import 'package:coin_ease/bloc/transactions/transaction_bloc.dart';
import 'package:coin_ease/colors.dart';
import 'package:coin_ease/models/transaction_model.dart';
import 'package:coin_ease/models/user_model.dart';
import 'package:coin_ease/widgets/transactionsList.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TransactionAll extends StatefulWidget {
  final List<TransactionModel>? transactions;
  final UserModel? user;
  final TransactionBloc transactionBloc;
  const TransactionAll(
      {super.key, this.user, this.transactions, required this.transactionBloc});

  @override
  State<TransactionAll> createState() => _TransactionAllState();
}

class _TransactionAllState extends State<TransactionAll> {
  @override
  void initState() {
    print('init state ${widget.transactions}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colors['primary'],
        title: const Text('Transactions history'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: BlocProvider<TransactionBloc>(
          create: (context) => widget.transactionBloc,
          child: TransactionsList(
            user: widget.user,
            count: 2147483647,
          ),
        ),
      ),
    );
  }
}
