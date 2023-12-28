import 'package:coin_ease/bloc/transaction_detail_bloc/repo.dart';
import 'package:coin_ease/bloc/transaction_detail_bloc/transaction_detail_bloc.dart';
import 'package:coin_ease/bloc/transaction_detail_bloc/transaction_detail_event.dart';
import 'package:coin_ease/bloc/transaction_detail_bloc/transaction_detail_state.dart';
import 'package:coin_ease/colors.dart';
import 'package:coin_ease/models/account_model.dart';
import 'package:coin_ease/models/transaction_model.dart';
import 'package:coin_ease/models/user_model.dart';
import 'package:coin_ease/services/user_service.dart';
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
          backgroundColor: colors['primary'],
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
          return  Scaffold
    (
        
        body: FutureBuilder(
            future: initializeData(),
            builder: ((context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              } else {
                UserAccount? sender = widget.transaction.isDebit
                    ? widget.account
                    : accountDetails?.account;
                UserAccount? receiver = widget.transaction.isDebit
                    ? accountDetails?.account
                    : widget.account;
                return Column(
                  children: [
                    Container(
                      width: double.infinity,
                      height: 270,
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
                            ' Rs. ${widget.transaction.isDebit ? '-' : '+'} ${widget.transaction.amount}',
                            style: const TextStyle(
                                color: Colors.black,
                                fontSize: 40,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 40),
                          Text(
                            sender?.title ?? '',
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
                            receiver?.title ?? '',
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      height: 300,
                      margin: const EdgeInsets.only(
                          top: 20, bottom: 10, left: 20, right: 20),
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(20)),
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
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w400),
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
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w400),
                              ),
                              const SizedBox(width: 10),
                              Text(
                                widget.transaction.refNumber,
                                style: const TextStyle(fontSize: 18),
                              )
                            ],
                          ),
                        ],
                      ),
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
