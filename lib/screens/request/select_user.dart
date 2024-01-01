import 'package:coin_ease/colors.dart';
import 'package:coin_ease/models/user_model.dart';
import 'package:coin_ease/screens/request/viewRequests.dart';
import 'package:coin_ease/services/user_service.dart';
import 'package:coin_ease/widgets/users_list.dart';
import 'package:flutter/material.dart';

class RequestMoney extends StatefulWidget {
  const RequestMoney({super.key});

  @override
  State<RequestMoney> createState() => _RequestMoneyState();
}

class _RequestMoneyState extends State<RequestMoney> {
  List<UserModel>? userList;

  void updateState(result) {
    setState(() {
      userList = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    final UserService userService = UserService();
    TextEditingController accController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colors['primary'],
        title: const Text('Request Money'),
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Requests()));
            },
            child: const Icon(Icons.notifications_on),
          ),
          const SizedBox(width: 15)
        ],
      ),
      body: SingleChildScrollView(
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
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
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
                      backgroundColor: colors['primary'],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      )),
                  child: const Text('Search')),
            ),
            UserList(
              users: userList,
              isSend: false,
            ),
          ],
        ),
      )),
    );
  }
}
