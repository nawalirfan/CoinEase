import 'package:coin_ease/colors.dart';
import 'package:flutter/material.dart';
import 'package:coin_ease/models/account_model.dart';

class UserInfoWidget extends StatelessWidget {
  final String? userName;
  final UserAccount? userAccount;
  final bool obscureText;
  final VoidCallback onToggleVisibility;

  UserInfoWidget({
    required this.userName,
    required this.userAccount,
    required this.obscureText,
    required this.onToggleVisibility,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 320,
      height: 200.0,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: AppColors.primaryColor.shade900,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                userName ?? '',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              GestureDetector(
                onTap: onToggleVisibility,
                child: Icon(
                  obscureText
                      ? Icons.visibility_off_outlined
                      : Icons.remove_red_eye_outlined,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          const Text(
            'Current Balance',
            style: TextStyle(
              color: Color.fromARGB(255, 59, 59, 59),
            ),
          ),
          const SizedBox(height: 5),
          Row(
            children: [
              Text(
                obscureText
                    ? '....'
                    : 'Rs. ${userAccount?.balance?.toStringAsFixed(3) ?? ''}',
                style: const TextStyle(
                  fontSize: 27,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          const SizedBox(height: 23),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                userAccount?.accountType == 'mastercard'
                    ? 'assets/mastercard.jpg'
                    : 'assets/visa.jpg',
                height: 40,
                width: 50,
              ),
              const Icon(
                Icons.arrow_forward,
                color: Colors.black,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
