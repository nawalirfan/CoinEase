import 'package:flutter/material.dart';

Map<String, Color> colors = {
  'primary': const Color.fromARGB(255, 47, 156, 138),
  'secondary': const Color.fromARGB(87, 133, 238, 220)
};

class AppColors {
  static const MaterialColor primaryColor = MaterialColor(
    0xFF2F9C8A,
    <int, Color>{
      50: Color(0xFFE0F7F5),
      100: Color(0xFFB3E9E1),
      200: Color(0xFF80D9CD),
      300: Color(0xFF4DC9B9),
      400: Color(0xFF26BFAA),
      500: Color(0xFF2F9C8A),
      600: Color(0xFF1E6F64),
      700: Color(0xFF175D53),
      800: Color(0xFF114C42),
      900: Color(0x5785EEDC),
    },
  );
}
