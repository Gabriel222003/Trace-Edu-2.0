import 'package:flutter/material.dart';
import 'package:trace_edu/Componentes/TriceText.dart';
import 'package:trace_edu/Views/Login.dart';

class Bemvindo extends StatelessWidget {
  const Bemvindo({super.key});

  Future<void> markAsSeen(BuildContext context) async {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const Login()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const TriceText(
                  label: 'Bem-vindo!',
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  ),
                const SizedBox(height: 24.0),
                const TriceText(
                  label: 'Gerencie suas faltas e certificados com facilidade!',
                  fontWeight: FontWeight.normal,
                  textAlign: TextAlign.center,
                  fontSize: 20,
                  color: Colors.white,
                  ),
                const SizedBox(height: 40.0),
                ElevatedButton(
                  onPressed: () => markAsSeen(context),
                  child: const Text(
                    'Continuar',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}