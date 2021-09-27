import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taxi_app/src/providers/login_form_provider.dart';
import 'package:taxi_app/src/ui/input_decorations.dart';
import 'package:taxi_app/src/widgets/widgets.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AuthBackground(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 250,
              ),
              CardContainer(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Inicio de Sesion',
                      style: Theme.of(context).textTheme.headline5,
                    ),
                    const SizedBox(height: 30),
                    ChangeNotifierProvider(
                      create: (_) => LoginFormProvider(),
                      child: const _LoginForm(),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              const Text(
                'Crear una Nueva Cuenta',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 50,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _LoginForm extends StatelessWidget {
  const _LoginForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final loginForm = Provider.of<LoginFormProvider>(context);
    return Form(
      key: loginForm.formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        children: [
          TextFormField(
            autocorrect: false,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecorations.authInputDecoration(
              hintText: 'Example@gmail.com',
              labelText: 'Correo Electronico',
              prefixIcon: Icons.alternate_email_sharp,
            ),
            onChanged: (value) => loginForm.email = value,
            validator: (value) {
              String pattern =
                  r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
              RegExp regExp = RegExp(pattern);
              return regExp.hasMatch(value ?? '')
                  ? null
                  : 'El Ingresado no luce como un Correo';
            },
          ),
          const SizedBox(
            height: 30,
          ),
          TextFormField(
            obscureText: true,
            autocorrect: false,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecorations.authInputDecoration(
              hintText: '*********',
              labelText: 'Contrasena',
              prefixIcon: Icons.lock_outline,
            ),
            onChanged: (value) => loginForm.password = value,
            validator: (value) {
              return (value != null && value.length >= 6)
                  ? null
                  : 'La Contrasena debe ser mayor a 6 Caracteres';
            },
          ),
          const SizedBox(
            height: 30,
          ),
          MaterialButton(
            onPressed: () {
              (!loginForm.isValidForm())
                  ? null
                  : Navigator.pushReplacementNamed(context, 'main');
            },
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            disabledColor: Colors.grey,
            elevation: 0,
            color: Colors.indigo,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 15),
              child: const Text(
                'Ingresar',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
