import 'package:coin_ease/bloc/transactions/transaction_bloc.dart';
import 'package:coin_ease/bloc/transactions/transaction_event.dart';
import 'package:coin_ease/colors.dart';
import 'package:coin_ease/models/account_model.dart';
import 'package:coin_ease/models/transaction_model.dart';
import 'package:coin_ease/models/user_model.dart';
import 'package:coin_ease/screens/account_details.dart';
import 'package:coin_ease/screens/Send/select_user.dart';
import 'package:coin_ease/screens/transaction_history.dart';
import 'package:coin_ease/services/user_service.dart';
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
  final UserService _userService = UserService();
  TransactionBloc? _transactionBloc;
  String? loggedInUserId;
  UserModel? loggedInUser;
  UserAccount? loggedInUserAccount;
  List<TransactionModel>? transactionHistory = [];

  bool obscureText = false;

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
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      _initializeData();
    });
  }

  @override
  Widget build(BuildContext context) {
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
                                      )));
                        },
                        child: Container(
                          width: 320,
                          height: 200.0,
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: colors['secondary'],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    loggedInUser?.name ?? '',
                                    style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black,
                                      // color: Color.fromARGB(255, 116, 93, 122),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        obscureText = !obscureText;
                                      });
                                    },
                                    child: Icon(
                                        obscureText
                                            ? Icons.remove_red_eye_outlined
                                            : Icons.visibility_off_outlined,
                                        color: Colors.black
                                        // color: Color.fromARGB(255, 116, 93, 122),
                                        ),
                                  )
                                ],
                              ),
                              const SizedBox(height: 20),
                              const Text(
                                'Current Balance',
                                style: TextStyle(
                                  color: Color.fromARGB(255, 59, 59, 59),
                                ),
                              ),
                              const SizedBox(height: 5),
                              Row(
                                children: [
                                  Text(
                                    // change
                                    obscureText
                                        ? '....'
                                        : 'Rs. ${loggedInUserAccount?.balance?.toStringAsFixed(2)}',
                                    style: const TextStyle(
                                        fontSize: 27,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black
                                        // color: Color.fromARGB(255, 116, 93, 122),
                                        ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 23),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Image.asset(
                                    // change
                                    loggedInUserAccount?.accountType ==
                                            'mastercard'
                                        ? 'assets/mastercard.jpg'
                                        : 'assets/visa.jpg',
                                    height: 40,
                                    width: 50,
                                  ),
                                  const Icon(
                                    Icons.arrow_forward,
                                    color: Colors.black,
                                    // color: Color.fromARGB(255, 116, 93, 122),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const SendMoney()));
                        },
                        child: Column(
                          children: [
                            CircleAvatar(
                              radius: 30,
                              backgroundColor: colors['primary'],
                              foregroundColor: Colors.white,
                              child: Transform.rotate(
                                angle: 330 *
                                    3.1415926535 /
                                    180, // Rotate by 45 degrees (in radians)
                                child: const Icon(Icons.send),
                              ),
                            ),
                            const SizedBox(height: 10),
                            const Text('Send')
                          ],
                        ),
                      ),
                      Column(
                        children: [
                          CircleAvatar(
                            radius: 30,
                            backgroundColor: colors['primary'],
                            foregroundColor: Colors.white,
                            child: const Icon(Icons.arrow_downward),
                          ),
                          const SizedBox(height: 10),
                          const Text('Request')
                        ],
                      ),
                      Column(
                        children: [
                          CircleAvatar(
                              radius: 30,
                              backgroundColor: colors['primary'],
                              foregroundColor: Colors.white,
                              child: const Icon(Icons.sticky_note_2_outlined)),
                          const SizedBox(height: 10),
                          const Text('Bills')
                        ],
                      ),
                      Column(
                        children: [
                          CircleAvatar(
                              radius: 30,
                              backgroundColor: colors['primary'],
                              foregroundColor: Colors.white,
                              child: const Icon(Icons.query_stats)),
                          const SizedBox(height: 10),
                          const Text('Analytics')
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                  Column(
                    children: [
                      Padding(
                          padding: const EdgeInsets.only(left: 20, right: 18),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Transaction history',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => TransactionAll(
                                              transactions: transactionHistory,
                                              user: loggedInUser,
                                              transactionBloc:
                                                  _transactionBloc!,
                                            )), // Replace TransactionsAll with your actual screen/widget
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
                          child: TransactionsList(user: loggedInUser, count: 4),
                        ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: BNavBar(index: 1, user: loggedInUser));
  }
}
