import 'package:coin_ease/colors.dart';
import 'package:coin_ease/models/request_model.dart';
import 'package:coin_ease/models/user_model.dart';
import 'package:coin_ease/screens/request/request_detail.dart';
import 'package:coin_ease/screens/request/viewRequests.dart';
import 'package:coin_ease/services/auth_service.dart';
import 'package:coin_ease/services/request_service.dart';
import 'package:flutter/material.dart';

class RequestMoney extends StatefulWidget {
  const RequestMoney({Key? key}) : super(key: key);

  @override
  State<RequestMoney> createState() => _RequestMoneyState();
}

class _RequestMoneyState extends State<RequestMoney> {
  AuthService auth = AuthService();
  RequestService req = RequestService();
  UserModel? user;
  List<RequestModel>? reqList = [];

  TextEditingController accController = TextEditingController();

  void updateState(result) {
    setState(() {
      reqList = result;
    });
  }

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
        title: const Text('Request Money'),
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Requests()),
              );
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
                  contentPadding: const EdgeInsets.only(left: 15),
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () async {
                    req.getRequests(user).then((List<RequestModel>? result) {
                      updateState(result);
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric( vertical: 15), // Adjust the vertical padding
                    minimumSize: Size(double.infinity, 50),
                    backgroundColor: colors['primary'],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  child: const Text('Search'),
                ),
              ),
              if (reqList != null && reqList!.isNotEmpty)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),
                    const Text(
                      'Requests:',
                      style: TextStyle(fontSize: 20),
                    ),
                    const SizedBox(height: 10),
                    for (RequestModel request in reqList!)
                      Container(
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
                                ),
                              ),
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
                            subtitle:
                                Text(request.dateTime.toDate().toString()),
                            trailing: Text(
                              ' Rs. ${request.amount}',
                              style: const TextStyle(
                                color:  Color.fromARGB(255, 9, 129, 79),
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}
