import 'package:flutter/material.dart';
import 'package:trace_edu/Controllers/ControllerCadastrarMateria.dart';
import 'package:trace_edu/Views/Configuracoes.dart';
import 'package:trace_edu/Views/Faltas.dart';
import 'package:trace_edu/Views/PerfildoAluno.dart';
import '../Componentes/TriceText.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class CadastrarMateria extends StatelessWidget {
  const CadastrarMateria({super.key});

  @override
  Widget build(BuildContext context) {
    final storage = const FlutterSecureStorage();
    final controller = ControllerCadastrarMateria();
    final nomeMateria = TextEditingController();
    final horas = TextEditingController();
    final horaAula = TextEditingController();
    final qtdFaltas = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: Text("Cadastrar Matéria"),
      leading: IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () async{
          Navigator.pop(context, true);
        },
      ),
    ),
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
                controller: nomeMateria,
                decoration: const InputDecoration(labelText: 'Nome da Matéria'),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: horas,
                decoration: const InputDecoration(labelText: 'Total de horas da matéria(exemplo: 120)'),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 12),
              TextField(
                controller: horaAula,
                decoration: const InputDecoration(labelText: 'Quantidade de horas da matéria em minutos(exemplo: 240)'),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 12),
              TextField(
                controller: qtdFaltas,
                decoration: const InputDecoration(labelText: 'Quantidade de faltas'),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 24.0),
              ElevatedButton(
                onPressed: () async{
                  final idUsuario = await storage.read(key: 'idUsuario');

                  if (idUsuario == null || nomeMateria.text.isEmpty || horas.text.isEmpty || horaAula.text.isEmpty || qtdFaltas.text.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Preencha todos os campos corretamente')),
                    );
                    return;
                  }

                  controller.adiconarMateria(
                    nomeMateria.text,
                    int.parse(horas.text),
                    int.parse(horaAula.text),
                    int.parse(idUsuario),
                    int.parse(qtdFaltas.text),
                  );

                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Matéria adicionada com sucesso!')),
                  );

                  // Limpar campos
                  nomeMateria.clear();
                  horas.clear();
                  horaAula.clear();
                  qtdFaltas.clear();
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
              onPressed: () async{
                // Navegar para Menu
                  final idUsuario = await storage.read(key: 'idUsuario');
                  Navigator.pushReplacementNamed(context, '/telaInicial', arguments: idUsuario,);
               
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
                  Icon(Icons.class_sharp, color: Colors.white70),
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
