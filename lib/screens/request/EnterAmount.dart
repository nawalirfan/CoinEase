import 'package:coin_ease/colors.dart';
import 'package:coin_ease/models/user_model.dart';
import 'package:coin_ease/screens/Send/confirm.dart';
import 'package:coin_ease/screens/home_page.dart';
import 'package:coin_ease/services/auth_service.dart';
import 'package:coin_ease/services/request_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class EnterRequestAmount extends StatelessWidget {
  final UserModel user;
  const EnterRequestAmount({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    TextEditingController amount = TextEditingController();
    TextEditingController message = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: colors['primary'],
        title: const Text('Request Money'),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Enter Amount: ',
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: amount,
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly,
              ],
              decoration: InputDecoration(
                  filled: true,
                  contentPadding: const EdgeInsets.only(left: 15),
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  )),
            ),
            const SizedBox(height: 20),
            const Text(
              'Enter a message: ',
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: message,
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
                    AuthService auth = AuthService();
                    UserModel? reqFrom = await auth.getLoggedInUser();
                    RequestService service = RequestService();
                    bool success = await service.createRequest(
                        reqFrom, user, double.parse(amount.text), message.text);

                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(success
                            ? 'Request Successfully Sent!'
                            : 'Request failed')));
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HomePage()));
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: colors['primary'],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      )),
                  child: const Text('Request')),
            ),
          ],
        ),
      ),
    );
  }
}
