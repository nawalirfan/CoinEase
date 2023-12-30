import 'package:coin_ease/bloc/transaction_detail_bloc/transaction_detail_repo.dart';
import 'package:coin_ease/bloc/transaction_detail_bloc/transaction_detail_bloc.dart';
import 'package:coin_ease/bloc/transaction_detail_bloc/transaction_detail_event.dart';
import 'package:coin_ease/bloc/transaction_detail_bloc/transaction_detail_state.dart';
import 'package:coin_ease/colors.dart';
import 'package:coin_ease/models/account_model.dart';
import 'package:coin_ease/models/transaction_model.dart';
import 'package:coin_ease/models/user_model.dart';
import 'package:coin_ease/services/user_service.dart';
import 'package:coin_ease/widgets/transactionDetail_Column.dart';
import 'package:coin_ease/widgets/transactionDetail_Container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TransactionDetail extends StatefulWidget {
  final TransactionModel transaction;
  final UserAccount? account;
  const TransactionDetail({super.key, required this.transaction, this.account});

  @override
  State<TransactionDetail> createState() => _TransactionDetailState();
}

class _TransactionDetailState extends State<TransactionDetail> {
  final transactionDetail_Bloc _ListBloc = transactionDetail_Bloc();
  late UserModel? accountDetails;

  Future<void> initializeData() async {
    try {
      UserService userService = UserService();
      accountDetails =
          await userService.getUserById(widget.transaction.accountTo['id']);
    } catch (e) {
      print('error in Transaction Detail while getting transactions: $e');
    }
  }

  @override
  void initState() {
    super.initState();
    _loadData();
    transactionDetail_Repository().getList();
  }

  Future<void> _loadData() async {
    _ListBloc.add(LoadDataEvents());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        title: Text(
            widget.transaction.isDebit ? 'Money Debited' : 'Money Credited'),
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return BlocBuilder<transactionDetail_Bloc, transactionDetail_State>(
      bloc: _ListBloc,
      builder: (context, state) {
        if (state is transaction_loadingState) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is transaction_LoadedState) {
          return Scaffold(
              body: FutureBuilder(
                  future: initializeData(),
                  builder: ((context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    } else {
                      UserAccount? sender = widget.transaction.isDebit
                          ? widget.account
                          : accountDetails?.account;
                      UserAccount? receiver = widget.transaction.isDebit
                          ? accountDetails?.account
                          : widget.account;
                      return Column(
                        children: [
                          //widget
                          TransactionDetailColumn(
                            transaction: widget.transaction,
                            sender: sender,
                            receiver: receiver,
                          ),
                          const SizedBox(height: 20),
                          //widget
                          TransactionDetailsContainer(
                            sender: sender,
                            receiver: receiver,
                            transaction: widget.transaction,
                          ),
                        ],
                      );
                    }
                  })));
        } else if (state is transaction_ErrorState) {
          return Center(
            child: Text(state.error),
          );
        } else {
          return const Center(child: Text('Unknown state'));
        }
      },
    );
  }
}
