import 'package:flutter/material.dart';
import 'package:taxi_app/src/widgets/intro_widget.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: IntroWidget(),
    );
  }
}
