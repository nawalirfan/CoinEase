import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coin_ease/bloc/my_account_bloc/my_account_bloc.dart';
import 'package:coin_ease/bloc/my_account_bloc/my_account_event.dart';
import 'package:coin_ease/bloc/my_account_bloc/my_account_state.dart';
import 'package:coin_ease/colors.dart';
import 'package:coin_ease/models/account_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AccountDetail extends StatefulWidget {
  final UserAccount? account;

  const AccountDetail({super.key, this.account});

  @override
  State<AccountDetail> createState() => _AccountDetailState();
}

class _AccountDetailState extends State<AccountDetail> {
  final AccountDetail_Bloc _accountBloc = AccountDetail_Bloc();
  bool obscureText = false;
  bool isSwitched = false;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    _accountBloc.add(LoadDataListEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        title: const Text('My Account'),
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return BlocBuilder<AccountDetail_Bloc, AccountDetail_State>(
      bloc: _accountBloc,
      builder: (context, state) {
        if (state is LoadingState) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is LoadedState) {
          return Column(
            children: [
              Expanded(
                child: buildListView(state.records),
              ),
            ],
          );
        } else if (state is ErrorState) {
          return Center(
            child: Text(state.error),
          );
        } else {
          return const Center(child: Text('Unknown state'));
        }
      },
    );
  }

  Widget buildListView(List<DocumentSnapshot> account) {
    return Column(
      children: [
        const SizedBox(height: 30),
        !isSwitched
            ? Container(
                width: 250,
                height: 300,
                margin:
                    const EdgeInsets.symmetric(horizontal: 80, vertical: 10),
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: AppColors.primaryColor.shade900,
                ),
                child: Column(
                  children: [
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Image.asset(
                          'assets/coin.png',
                          height: 50,
                          width: 50,
                        ),
                        const SizedBox(width: 60),
                        Expanded(
                          child: Align(
                            alignment: Alignment.bottomCenter,
                            child: Text(
                              obscureText
                                  ? '################'
                                  : widget.account?.cardNo ?? '',
                              style: TextStyle(
                                fontSize: obscureText ? 23 : 25,
                                letterSpacing: 2,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 90),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Image.asset(
                          'assets/${widget.account?.accountType == 'mastercard' ? 'mastercard.jpg' : 'visa.jpg'}',
                          height: 60,
                          width: 60,
                        ),
                        const SizedBox(width: 10),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              obscureText = !obscureText;
                            });
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: const Color.fromARGB(55, 18, 65, 51),
                            ),
                            child: Text(
                              obscureText ? 'Show' : 'Hide',
                              style: const TextStyle(fontSize: 18),
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              )
            : Container(),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Column(
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.lock_outline,
                      color: AppColors.primaryColor,
                    ),
                    SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Lock Card',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          'Lock this card temporarily',
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w300,
                          ),
                        )
                      ],
                    )
                  ],
                )
              ],
            ),
            Switch(
              activeColor: AppColors.primaryColor,
              value: isSwitched,
              onChanged: (value) {
                setState(() {
                  isSwitched = value;
                });
              },
            ),
          ],
        ),
        //const SizedBox(height: 20),
        Column(
          children: [
            Container(
              margin: const EdgeInsets.all(35),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: const Color.fromARGB(255, 190, 189, 189),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'My CoinEase Account Number',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    widget.account?.accountNumber ?? '',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            //const SizedBox(height: 20),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 35),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 255, 255, 255),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'My CoinEase IBAN Number',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    widget.account?.iban ?? '',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
