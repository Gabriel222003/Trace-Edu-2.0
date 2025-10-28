import 'package:flutter/material.dart';
import '../Controllers/ControllerRegistro.dart';

class Registro extends StatelessWidget {
  final nome = TextEditingController();
  final email = TextEditingController();
  final senha = TextEditingController();
  final confirmarSenha = TextEditingController();
  final controller = ControllerRegistro();

  Registro({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue,
      appBar: AppBar(title: const Text('Registro')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(controller: nome, decoration: const InputDecoration(labelText: 'Nome')),
            const SizedBox(height: 12),
            TextField(controller: email, decoration: const InputDecoration(labelText: 'E-mail')),
            const SizedBox(height: 12),
            TextField(controller: senha, obscureText: true, decoration: const InputDecoration(labelText: 'Senha')),
            const SizedBox(height: 12),
            TextField(controller: confirmarSenha, obscureText: true, decoration: const InputDecoration(labelText: 'Confirmar Senha')),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                controller.registrarUsuario(context, nome, email, senha, confirmarSenha);
              },
              child: const Text('Registrar'),
            ),
          ],
        ),
      ),
    );
  }
}
