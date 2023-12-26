import 'package:coin_ease/colors.dart';
import 'package:coin_ease/models/request_model.dart';
import 'package:coin_ease/models/user_model.dart';
import 'package:coin_ease/screens/request/request_detail.dart';
import 'package:coin_ease/services/auth_service.dart';
import 'package:coin_ease/services/request_service.dart';
import 'package:flutter/material.dart';

class Requests extends StatefulWidget {
  const Requests({super.key});

  @override
  State<Requests> createState() => _RequestsState();
}

class _RequestsState extends State<Requests> {
  AuthService auth = AuthService();
  RequestService req = RequestService();
  UserModel? user;
  List<RequestModel>? reqList = [];
  Future<void> _initializeData() async {
    user = await auth.getLoggedInUser();
    reqList = await req.getRequests(user);
    setState(() {});
    print(reqList.toString());
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
      appBar: AppBar(
        backgroundColor: colors['primary'],
        title: const Text('Requests'),
      ),
      body: reqList!.isEmpty
          ? const Center(
              child: Text(
                'No requests found',
                style: TextStyle(fontSize: 20),
              ),
            )
          : ListView.builder(
              shrinkWrap: true,
              itemCount: reqList?.length,
              itemBuilder: (context, index) {
                RequestModel request = reqList![index];
                return Container(
                  margin: const EdgeInsets.only(top: 5, bottom: 5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: colors['secondary'],
                  ),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => RequestDetail(
                                  request: request,
                                  user: user!,
                                )),
                      );
                    },
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: colors['primary'],
                        child: Text(
                          (request.reqfrom['title'] ?? '')
                              .substring(0, 1)
                              .toUpperCase(),
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                      title: Text(request.reqfrom['title'] ?? ''),
                      subtitle: Text(request.dateTime.toDate().toString()),
                      trailing: Text(
                        ' Rs. ${request.amount}',
                        style: const TextStyle(
                            color: const Color.fromARGB(255, 9, 129, 79),
                            fontSize: 15,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                );
              }),
    );
  }
}
