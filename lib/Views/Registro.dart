import 'package:flutter/material.dart';
import '../Controllers/ControllerRegistro.dart';

class Registro extends StatelessWidget {
  final nomeController = TextEditingController();
  final emailController = TextEditingController();
  final senhaController = TextEditingController();
  final controller = ControllerRegistro();

  Registro({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Registro')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: nomeController,
              decoration: const InputDecoration(labelText: 'Nome'),
            ),
            TextField(
              controller: emailController,
              decoration: const InputDecoration(labelText: 'E-mail'),
            ),
            TextField(
              controller: senhaController,
              obscureText: true,
              decoration: const InputDecoration(labelText: 'Senha'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                controller.registrarUsuario(
                  context,
                  nomeController,
                  emailController,
                  senhaController,
                );
              },
              child: const Text('Registrar'),
            ),
          ],
        ),
      ),
    );
  }
}
