import 'package:coin_ease/colors.dart';
import 'package:coin_ease/models/user_model.dart';
import 'package:coin_ease/screens/settings.dart';
import 'package:flutter/material.dart';

class BNavBar extends StatelessWidget {
  UserModel? user;
  final index;
  BNavBar({super.key, required this.index, this.user});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: index,
      backgroundColor: colors['secondary'],
      selectedItemColor: colors['primary'],
      unselectedItemColor: const Color.fromARGB(255, 105, 104, 105),
      items: [
        const BottomNavigationBarItem(
          icon: Icon(Icons.help_center),
          label: 'Help Center',
        ),
        BottomNavigationBarItem(
          icon: GestureDetector(
            onTap: () {
              // Navigator.push(context,
              //     MaterialPageRoute(builder: (context) => const HomePage()));
              Navigator.pushNamed(context, '/HomePage');
            },
            child: const Icon(Icons.home),
          ),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => SettingsScreen(user: user)));
            },
            child: const Icon(Icons.settings),
          ),
          label: 'Settings',
        ),
      ],
    );
  }
}
