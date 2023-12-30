import 'package:coin_ease/screens/Send/select_user.dart';
import 'package:coin_ease/screens/request/select_user.dart';
import 'package:flutter/material.dart';
import 'package:coin_ease/colors.dart';

class ActionButtonsRow extends StatelessWidget {
  const ActionButtonsRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ActionButton(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const SendMoney()),
            );
          },
          icon: Icons.send,
          label: 'Send',
        ),
        ActionButton(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const RequestMoney()),
            );
          },
          icon: Icons.arrow_downward,
          label: 'Request',
        ),
        ActionButton(
          onTap: () {
            // Add navigation for Bills
          },
          icon: Icons.sticky_note_2_outlined,
          label: 'Bills',
        ),
        // ActionButton(
        //   onTap: () {
        //     // Add navigation for Analytics
        //   },
        //   icon: Icons.query_stats,
        //   label: 'Analytics',
        // ),
      ],
    );
  }
}

class ActionButton extends StatelessWidget {
  final VoidCallback onTap;
  final IconData icon;
  final String label;

  const ActionButton({
    Key? key,
    required this.onTap,
    required this.icon,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: colors['primary'],
            foregroundColor: Colors.white,
            child: Transform.rotate(
              angle: 330 * 3.1415926535 / 180,
              child: Icon(icon),
            ),
          ),
          const SizedBox(height: 10),
          Text(label),
        ],
      ),
    );
  }
}