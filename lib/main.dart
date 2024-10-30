import 'package:flutter/material.dart';
import 'package:flutter_app/src/configuracao/cores_customizadas.dart';
import 'package:flutter_app/src/pages/autenticacao/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login',
      // theme: ThemeData(
      //  colorSchemeSeed: CoresCustomizadas.corAppCustomizada,
      //  scaffoldBackgroundColor: Colors.black.withAlpha(190),
      // appBarTheme: AppBarTheme(
      //    backgroundColor: Colors.black.withAlpha(190),
      //  ),
      //  useMaterial3: true,
      //  brightness: Brightness.dark,
      //),
      theme: ThemeData(
        colorSchemeSeed: CoresCustomizadas.corAppCustomizada,
        useMaterial3: true,
        brightness: Brightness.light,
        scaffoldBackgroundColor: Colors.white.withAlpha(190),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: CoresCustomizadas.corAppCustomizada,
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.white.withAlpha(210),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: CoresCustomizadas.corAppCustomizada,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18),
            ),
          ),
        ),
      ),
      home: const LoginScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
