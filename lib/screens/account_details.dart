import 'package:coin_ease/colors.dart';
import 'package:coin_ease/models/account_model.dart';
import 'package:flutter/material.dart';

class AccountDetail extends StatefulWidget {
  final UserAccount account;
  const AccountDetail({super.key, required this.account});

  @override
  State<AccountDetail> createState() => _AccountDetailState();
}

class _AccountDetailState extends State<AccountDetail> {
  bool obscureText = false;
  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colors['primary'],
        title: const Text('My Account'),
      ),
      body: Column(
        children: [
          const SizedBox(height: 30),
          Container(
            width: 250,
            height: 300,
            margin: const EdgeInsets.symmetric(horizontal: 80, vertical: 20),
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: colors['secondary']),
            child: Column(
              children: [
                const SizedBox(height: 10),
                Row(
                  children: [
                    const SizedBox(width: 10),
                    Image.asset(
                      'assets/coin.png',
                      height: 70,
                      width: 70,
                    ),
                    const SizedBox(width: 60),
                    Expanded(
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Text(
                          obscureText
                              ? '################'
                              : widget.account.cardNo,
                          style:
                              const TextStyle(fontSize: 25, letterSpacing: 2),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 80),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Image.asset(
                      'assets/${widget.account.accountType == 'mastercard' ? 'mastercard.jpg' : 'visa.jpg'}',
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
          ),
          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.lock_outline,
                        color: colors['primary'],
                      ),
                      const SizedBox(width: 10),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Lock Card',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w500),
                          ),
                          Text(
                            'Lock this card temporarily',
                            style: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.w300),
                          )
                        ],
                      )
                    ],
                  )
                ],
              ),
              Switch(
                  activeColor: colors['primary'],
                  value: isSwitched,
                  onChanged: (value) {
                    setState(() {
                      isSwitched = value;
                    });
                  })
            ],
          ),
          Container(
            margin: const EdgeInsets.all(35),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            alignment: Alignment.centerLeft,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                    color: const Color.fromARGB(255, 190, 189, 189))),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'My CoinEase Account Number',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                ),
                const SizedBox(height: 8),
                Text(
                  widget.account.accountNumber,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 35),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            alignment: Alignment.centerLeft,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                    color: const Color.fromARGB(255, 190, 189, 189))),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'My CoinEase IBAN Number',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                ),
                const SizedBox(height: 8),
                Text(
                  widget.account.iban,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.w500),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
