import 'package:flutter/material.dart';
import 'package:taxi_app/src/screens/screens.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Taxi Client App',
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
        scaffoldBackgroundColor: Colors.grey[300],
      ),
      initialRoute: 'login',
      routes: {
        'main': (_) => const MainScreen(),
        'login': (_) => const LoginScreen(),
        'register': (_) => const RegisterScreen(),
      },
    );
  }
}
