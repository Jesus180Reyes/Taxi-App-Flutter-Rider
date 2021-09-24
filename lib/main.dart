import 'package:flutter/material.dart';
import 'package:taxi_app/src/screens/login_screen.dart';
import 'package:taxi_app/src/screens/register_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Client App',
      initialRoute: 'login',
      routes: {
        'login': (_) => const LoginScreen(),
        'register': (_) => const RegisterScreen(),
      },
    );
  }
}
