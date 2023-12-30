import 'package:coin_ease/bloc/HomePage_bloc/homePage_repo.dart';
import 'package:coin_ease/bloc/HomePage_bloc/home_page_bloc.dart';
import 'package:coin_ease/bloc/HomePage_bloc/home_page_event.dart';
import 'package:coin_ease/bloc/HomePage_bloc/home_page_state.dart';
import 'package:coin_ease/bloc/transactions/transaction_bloc.dart';
import 'package:coin_ease/bloc/transactions/transaction_event.dart';
import 'package:coin_ease/colors.dart';
import 'package:coin_ease/models/account_model.dart';
import 'package:coin_ease/models/transaction_model.dart';
import 'package:coin_ease/models/user_model.dart';
import 'package:coin_ease/screens/account_details.dart';
import 'package:coin_ease/screens/Send/select_user.dart';
import 'package:coin_ease/screens/request/select_user.dart';
import 'package:coin_ease/screens/transaction_history.dart';
import 'package:coin_ease/services/user_service.dart';
import 'package:coin_ease/test_widgets/HomePage/UserInfoWidget_homepage.dart';
import 'package:coin_ease/test_widgets/HomePage/actionButtonRow_homePage.dart';
import 'package:coin_ease/widgets/bottom_navbar.dart';
import 'package:coin_ease/widgets/transactionsList.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomePage_Bloc _ListBloc = HomePage_Bloc();
  final UserService _userService = UserService();
  TransactionBloc? _transactionBloc;
  String? loggedInUserId;
  UserModel? loggedInUser;
  UserAccount? loggedInUserAccount;
  List<TransactionModel>? transactionHistory = [];

  bool obscureText = false;

  @override
  void initState() {
    super.initState();
    _loadData();
    HomePage_Repository().getList();
    Future.delayed(Duration.zero, () {
      _initializeData();
    });
  }

  Future<void> _loadData() async {
    _ListBloc.add(LoadHomePageDataEvent());
  }

  Future<void> _initializeData() async {
    try {
      loggedInUser = await _userService
          .getUser(FirebaseAuth.instance.currentUser?.phoneNumber);
      loggedInUserAccount = loggedInUser?.account;
      _transactionBloc = context.read<TransactionBloc>();
      _loadTransactions();
      setState(() {});
    } catch (e) {
      print('error while calling loggedInUser/account: ${e}');
    }
  }

  void _loadTransactions() {
    _transactionBloc?.add(LoadTransactionEvent(loggedInUser));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomePage_Bloc, HomePage_state>(
      bloc: _ListBloc,
      builder: (context, state) {
        if (state is HomePage_LoadingState) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is HomePage_LoadedState) {
          return Scaffold(
              body: SafeArea(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 15),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => AccountDetail(
                                      account: loggedInUserAccount,
                                    ),
                                  ),
                                );
                                //Navigator.push(context, '/AccountDetail' as Route<Object?>);
                              },
                              child: UserInfoWidget(
                                //widget
                                userName: loggedInUser?.name,
                                userAccount: loggedInUserAccount,
                                obscureText: obscureText,
                                onToggleVisibility: () {
                                  setState(() {
                                    obscureText = !obscureText;
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 30),
                        ActionButtonsRow(), //widget
                        const SizedBox(height: 30),
                        Column(
                          children: [
                            Padding(
                                padding:
                                    const EdgeInsets.only(left: 20, right: 18),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      'Transaction history',
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  TransactionAll(
                                                    transactions:
                                                        transactionHistory,
                                                    user: loggedInUser,
                                                    transactionBloc:
                                                        _transactionBloc!,
                                                  )),
                                        );
                                      },
                                      child: Row(
                                        children: [
                                          Text(
                                            'See all',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18,
                                                color: colors['primary']),
                                          ),
                                          const SizedBox(width: 5),
                                          Icon(
                                            Icons.arrow_forward,
                                            color: colors['primary'],
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                )),
                            const SizedBox(height: 10),
                            // TransactionsList(
                            //   transactions: transactionHistory,
                            //   count: 3,
                            //   account: loggedInUserAccount,
                            // )
                            if (loggedInUser !=
                                null) // Check if loggedInUser is not null
                              BlocProvider<TransactionBloc>(
                                create: (context) => _transactionBloc!,
                                child: TransactionsList(
                                    user: loggedInUser, count: 4),
                              ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              bottomNavigationBar: BNavBar(index: 1, user: loggedInUser));
        } else if (state is HomePage_ErrorState) {
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
