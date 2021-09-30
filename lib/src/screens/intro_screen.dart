import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      showSkipButton: true,
      showDoneButton: true,
      done: const Text(
        'Comenzar',
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
      onDone: () => Navigator.pushReplacementNamed(context, 'login'),
      showNextButton: true,
      skip: const Text(
        'Saltar',
        style: TextStyle(fontSize: 16),
      ),
      next: const Text(
        'Siguiente',
        style: TextStyle(fontSize: 16),
      ),
      animationDuration: 350,
      pages: [
        PageViewModel(
          title: "Bienvenido a Transporte Kariken",
          body: "Lo Mejor En Transporte Privado de Baltimore, Maryland",
          image: Image.asset(
            'assets/images/intro2.png',
            fit: BoxFit.cover,
          ),
        ),
        PageViewModel(
          title: "Viaja Seguro",
          body:
              "Conductores confiables, podras compartir tu Ubicacion en tiempo real",
          image: Image.asset(
            'assets/images/intro3.png',
            height: 300,
          ),
        ),
        PageViewModel(
          title: "Viaja a tu manera",
          body: "Programa tus viajes y escoge pagar en tarjeta o en efectivo",
          image: Image.asset(
            'assets/images/intro4.png',
            height: 330,
          ),
        ),
        PageViewModel(
          title: "VIaja con Estilo",
          body:
              "Flota de carros recientes en exelente estado y Conductores Profesionales.",
          image: Image.asset(
            'assets/images/intro5.png',
            height: 330,
          ),
        ),
      ],
    );
  }
}
