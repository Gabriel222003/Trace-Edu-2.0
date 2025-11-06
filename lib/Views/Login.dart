import 'package:flutter/material.dart';
import 'package:trace_edu/Componentes/TriceText.dart';
import 'package:trace_edu/Componentes/TriceTextField.dart';
import 'package:trace_edu/Controllers/ControllerLogin.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final Controllerlogin controller = Controllerlogin();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController senhaController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    senhaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const TriceText(
                label: 'Login',
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
              const SizedBox(height: 40.0),
              TriceTextField(
                label: 'E-mail',
                icon: Icons.email,
                keyboardType: TextInputType.emailAddress,
                controller: emailController, // 👈 conecta o controller
              ),
              const SizedBox(height: 16.0),
              TriceTextField(
                label: 'Senha',
                icon: Icons.lock,
                obscureText: true,
                controller: senhaController, // 👈 conecta o controller
              ),
              const SizedBox(height: 24.0),
              ElevatedButton(
                onPressed: () {
                  controller.login(context, emailController, senhaController);
                },
                child: const Text('Entrar'),
              ),
              const SizedBox(height: 16.0),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/registrar');
                },
                child: const TriceText(
                  label: 'Cadastrar',
                  fontSize: 16,
                  color: Colors.white,
                  decoration: TextDecoration.underline,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
