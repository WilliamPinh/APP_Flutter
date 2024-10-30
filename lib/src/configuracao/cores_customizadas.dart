import 'package:flutter/material.dart';

abstract class CoresCustomizadas {
  static final Map<int, Color> _opacidade = {
    50: const Color(0xFFE3F2FD),
    100: const Color(0xFFBBDEFB),
    200: const Color(0xFF90CAF9),
    300: const Color(0xFF64B5F6),
    400: const Color(0xFF42A5F5),
    500: const Color(0xFF2196F3),
    600: const Color(0xFF1E88E5),
    700: const Color(0xFF1976D2),
    800: const Color(0xFF1565C0),
    900: const Color(0xFF0D47A1),
  };

  static Color corContrasteCustomizada = const Color.fromARGB(255, 223, 8, 8);

  static MaterialColor corAppCustomizada = MaterialColor(0xFF2196F3, _opacidade);
}