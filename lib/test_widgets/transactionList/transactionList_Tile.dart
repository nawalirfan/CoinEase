import 'package:flutter/material.dart';
import 'package:coin_ease/colors.dart';

class TransactionTile extends StatelessWidget 
{
  final String title;
  final double amount;
  final bool isDebit;
  final String dateTime;
  final VoidCallback? onTap;

  const TransactionTile({
    Key? key,
    required this.title,
    required this.amount,
    required this.isDebit,
    required this.dateTime,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) 
  {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(top: 5, bottom: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: colors['secondary'],
        ),
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: colors['primary'],
            child: Text(
              (title ?? '').substring(0, 1).toUpperCase(),
              style: const TextStyle(color: Colors.white),
            ),
          ),
          title: Text(title),
          subtitle: Text(dateTime.toString()), // Adjust if needed
          trailing: Text(
            '${isDebit ? '-' : '+'} Rs. ${amount}',
            style: TextStyle(
              color: isDebit
                  ? const Color.fromARGB(255, 199, 33, 21)
                  : const Color.fromARGB(255, 9, 129, 79),
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
