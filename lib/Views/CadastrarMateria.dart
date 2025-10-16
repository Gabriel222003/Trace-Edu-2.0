import 'package:flutter/material.dart';
import '../Controllers/ControllerCadastrarMateria.dart';

class CadastrarMateria extends StatelessWidget {
  const CadastrarMateria({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = ControllerCadastrarMateria();

    final nomeController = TextEditingController();
    final presencaController = TextEditingController();
    final faltasController = TextEditingController();

    return Scaffold(
      body: Container(
        color: Colors.blue[700],
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Cadastrar Matéria',
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 40.0),
                TextField(
                  controller: nomeController,
                  decoration: const InputDecoration(labelText: 'Nome da Matéria'),
                ),
                TextField(
                  controller: presencaController,
                  decoration: const InputDecoration(labelText: 'Presenças'),
                  keyboardType: TextInputType.number,
                ),
                TextField(
                  controller: faltasController,
                  decoration: const InputDecoration(labelText: 'Faltas'),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 24.0),
                ElevatedButton(
                  onPressed: () {
                    controller.adicionarMateria(
                      context,
                      nomeController,
                      presencaController,
                      faltasController,
                    );
                  },
                  child: const Text('Adicionar'),
                ),
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Voltar'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
