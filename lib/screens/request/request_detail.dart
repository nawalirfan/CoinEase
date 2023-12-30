import 'package:coin_ease/colors.dart';
import 'package:coin_ease/models/request_model.dart';
import 'package:coin_ease/models/user_model.dart';
import 'package:coin_ease/screens/send/enter_amount.dart';
import 'package:coin_ease/screens/home_page.dart';
import 'package:coin_ease/services/request_service.dart';
import 'package:coin_ease/services/user_service.dart';
import 'package:flutter/material.dart';

class RequestDetail extends StatefulWidget {
  final RequestModel request;
  final UserModel user;
  const RequestDetail({super.key, required this.request, required this.user});

  @override
  State<RequestDetail> createState() => _TransactionDetailState();
}

class _TransactionDetailState extends State<RequestDetail> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: colors['primary'],
          title: const Text('Amount Requested'),
        ),
        body: Column(
          children: [
            Container(
              alignment: Alignment.center,
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
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/coin.png',
                    height: 90,
                    width: 90,
                  ),
                  Text(
                    ' Rs. ${widget.request.amount}',
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 40,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Container(
              height: 180,
              margin: const EdgeInsets.only(
                  top: 20, bottom: 10, left: 20, right: 20),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.all(Radius.circular(20)),
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
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(height: 10),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.request.reqfrom['title'] ?? '',
                            style: const TextStyle(
                                fontSize: 23, fontWeight: FontWeight.bold),
                          ),
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
                        'Date:   ',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w400),
                      ),
                      const SizedBox(width: 10),
                      Text(
                        widget.request.dateTime.toDate().toString(),
                        style: const TextStyle(fontSize: 18),
                      )
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(width: 10),
                      const Text(
                        'Message:   ',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w400),
                      ),
                      const SizedBox(width: 10),
                      Text(
                        widget.request.message,
                        style: const TextStyle(fontSize: 18),
                      )
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                    onPressed: () async {
                      RequestService req = RequestService();
                      bool deleted = await req.deleteRequest(
                          widget.request.id, widget.user.id);

                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => HomePage()));
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text(deleted
                              ? 'Request Deleted Successfully!'
                              : 'Error while deleting request, try again!')));
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: colors['primary']),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [Text('Delete'), Icon(Icons.delete)],
                    )),
                ElevatedButton(
                    onPressed: () async {
                      UserService service = UserService();
                      UserModel? user = await service
                          .getUserById(widget.request.reqfrom['id']);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => EnterAmount(user: user!)));
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: colors['primary']),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Send'),
                        SizedBox(width: 8),
                        Icon(Icons.send)
                      ],
                    ))
              ],
            )
          ],
        ));
  }
}
