import 'package:flutter/material.dart';
import 'package:trace_edu/Views/Configuracoes.dart';
import 'package:trace_edu/Views/Faltas.dart';
import 'package:trace_edu/Views/PerfildoAluno.dart';
import 'package:trace_edu/Views/TelaInicial.dart';
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

    return Scaffold(
      appBar: AppBar(title: Text("Cadastrar Matéria")),
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
              TextField(
                controller: nomeController,
                decoration: const InputDecoration(labelText: 'Nome da Matéria'),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: presencaController,
                decoration: const InputDecoration(labelText: 'Presenças'),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 12),
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
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        color: const Color(0xFF1B263B),
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.transparent,
                elevation: 0,
              ),
              onPressed: () {
                // Navegar para Menu
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TelaInicial()),
                );
              },
              child: const Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.home, color: Colors.white70),
                  Text(
                    "Menu",
                    style: TextStyle(color: Colors.white70, fontSize: 12),
                  ),
                ],
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.transparent,
                elevation: 0,
              ),
              onPressed: () {
                // Navegar para Configurações
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TelaConfiguracoes()),
                );
              },
              child: const Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.settings, color: Colors.white70),
                  Text(
                    "Configurações",
                    style: TextStyle(color: Colors.white70, fontSize: 12),
                  ),
                ],
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.transparent,
                elevation: 0,
              ),
              onPressed: () {
                // Navegar para Perfil
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PerfildoAluno()),
                );
              },
              child: const Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.person, color: Colors.white70),
                  Text(
                    "Perfil",
                    style: TextStyle(color: Colors.white70, fontSize: 12),
                  ),
                ],
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.transparent,
                elevation: 0,
              ),
              onPressed: () {
                // Navegar para Faltas
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Faltas()),
                );
              },
              child: const Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.grade, color: Colors.white70),
                  Text(
                    "Faltas",
                    style: TextStyle(color: Colors.white70, fontSize: 12),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      // bottomNavigationBar: const TriceBottomNavigationBar(numeroTela: 3),
    );
  }
}
