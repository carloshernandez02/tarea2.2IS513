import 'package:flutter/material.dart';
import 'package:app_login/src/Pages/register_page.dart';
import 'package:app_login/src/Pages/login_page.dart';
import 'package:app_login/src/Pages/home_page.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
      '/': (BuildContext context) => LoginPage(),
      '/register': (BuildContext context) => const RegisterPage(),
      '/home': (BuildContext context) => const HomePage(),
      },
    );
  }
}

