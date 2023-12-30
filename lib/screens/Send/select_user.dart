import 'package:coin_ease/bloc/get_users_bloc/sendMoney_repo.dart';
import 'package:coin_ease/bloc/get_users_bloc/send_money_bloc.dart';
import 'package:coin_ease/bloc/get_users_bloc/send_money_event.dart';
import 'package:coin_ease/bloc/get_users_bloc/send_money_state.dart';
import 'package:coin_ease/colors.dart';
import 'package:coin_ease/models/user_model.dart';
import 'package:coin_ease/services/user_service.dart';
import 'package:coin_ease/widgets/users_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SendMoney extends StatefulWidget {
  const SendMoney({super.key});

  @override
  State<SendMoney> createState() => _SendMoneyState();
}

class _SendMoneyState extends State<SendMoney> {
  final SendMoney_Bloc _sendMoneyBloc = SendMoney_Bloc();
  List<UserModel>? userList;

  void updateState(result) {
    setState(() {
      userList = result;
    });
  }

  @override
  void initState() {
    super.initState();
    _loadData();
    SendMoney_Repository().getList();
  }

  Future<void> _loadData() async {
    _sendMoneyBloc.add(LoadDataEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colors['primary'],
        title: const Text('Send Money'),
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    final UserService userService = UserService();
    TextEditingController accController = TextEditingController();
    return BlocBuilder<SendMoney_Bloc, SendMoney_state>(
      bloc: _sendMoneyBloc,
      builder: (context, state) {
        if (state is SendMoney_LoadingState) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is SendMoney_LoadedState) {
          return SingleChildScrollView(
              child: Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Enter IBAN / account number: ',
                  style: TextStyle(fontSize: 20),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: accController,
                  decoration: InputDecoration(
                      filled: true,
                      contentPadding: const EdgeInsets.only(left: 15),
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      )),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () async {
                        userService
                            .getUsers(accController.text)
                            .then((List<UserModel>? result) {
                          updateState(result);
                        });
                      },
                      style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric( vertical: 15), // Adjust the vertical padding
                          minimumSize: Size(double.infinity, 50), // Set the minimum width and height
                          backgroundColor: colors['primary'],
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          )),
                      child: const Text('Search')),
                ),
                UserList(
                  users: userList,
                  isSend: true,
                ),
              ],
            ),
          ));
        } else if (state is SendMoney_ErrorState) {
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