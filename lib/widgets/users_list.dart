import 'package:coin_ease/models/user_model.dart';
import 'package:coin_ease/screens/Send/enter_amount.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class UserList extends StatelessWidget {
  final List<UserModel>? users;

  const UserList({Key? key, required this.users}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: users?.length ?? 0,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        if (users != null && index < users!.length) {
          UserModel user = users![index];
          return Container(
            margin: const EdgeInsets.only(top: 5, bottom: 5),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => EnterAmount(user: user)));
              },
              child: ListTile(
                leading: CircleAvatar(
                  child: Text(user.name.substring(0, 1).toUpperCase()),
                ),
                title: Text(user.account?.title ?? ''),
              ),
            ),
          );
        } else {
          // Handle the case where users is null or index is out of bounds
          return Container();
        }
      },
    );
  }
}
