import 'package:flutter/material.dart';
import '../Controllers/ControllerCadastrarMateria.dart';
import '../Componentes/TriceText.dart';
import '../Componentes/TriceBottomNavigationBar.dart';

class CadastrarMateria extends StatelessWidget {
  const CadastrarMateria({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = ControllerCadastrarMateria();

    final nomeController = TextEditingController();
    final presencaController = TextEditingController();
    final faltasController = TextEditingController();

    return Scaffold(appBar: AppBar(
        title: Text("Cadastrar Matéria"),
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const TriceText(
                label: 'Matéria',
                fontSize: 36,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
              const SizedBox(height: 40.0),
              TextField(controller: nomeController, decoration: const InputDecoration(labelText: 'Nome da Matéria')),
              const SizedBox(height: 12),
              TextField(controller: presencaController, decoration: const InputDecoration(labelText: 'Presenças'), keyboardType: TextInputType.number),
              const SizedBox(height: 12),
              TextField(controller: faltasController, decoration: const InputDecoration(labelText: 'Faltas'), keyboardType: TextInputType.number,),
              const SizedBox(height: 24.0),
              ElevatedButton(
                onPressed: () {
                  controller.adicionarMateria(context, nomeController, presencaController, faltasController);
                },
                child: const Text('Adicionar'),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const TriceBottomNavigationBar(numeroTela: 3),
    );
  }
}
