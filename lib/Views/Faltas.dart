import 'package:flutter/material.dart';
import 'package:trace_edu/Views/Configuracoes.dart';
import 'package:trace_edu/Views/PerfildoAluno.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class Faltas extends StatelessWidget {
  const Faltas({super.key});

  @override
  Widget build(BuildContext context) {
    final storage = const FlutterSecureStorage();
    List<String> nomesMaterias = [
      'AED',
      'IoT',
      'Extensão IV',
      'Proj. Embarcados',
      'Proj. Computação',
    ];
    final List<ValueNotifier<bool>> openPanels = List.generate(
      nomesMaterias.length,
      (_) => ValueNotifier(false),
    );

    return Scaffold(
      backgroundColor: Colors.lightBlue,
      appBar: AppBar(title: const Text("Gerenciar Matérias")),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Padding(padding: EdgeInsets.symmetric(vertical: 3)),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: List.generate(nomesMaterias.length, (index) {
                      final nome = nomesMaterias[index];
                      final isOpenNotifier = openPanels[index];
                      return ValueListenableBuilder<bool>(
                        valueListenable: isOpenNotifier,
                        builder: (context, isOpen, _) {
                          return ExpansionPanelList(
                            expansionCallback: (panelIndex, isExpanded) {
                              isOpenNotifier.value = !isOpen;
                            },
                            children: [
                              ExpansionPanel(
                                isExpanded: isOpen,
                                headerBuilder: (context, isExpanded) {
                                  return ListTile(
                                    title: Text(
                                      nome,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Color.fromARGB(
                                          255,
                                          108,
                                          193,
                                          232,
                                        ),
                                      ),
                                    ),
                                  );
                                },
                                body: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Gerencie suas faltas:",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Color.fromARGB(
                                            255,
                                            108,
                                            193,
                                            232,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 10),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                            child: TextButton.icon(
                                              onPressed: () {},
                                              icon: const Icon(
                                                Icons.add,
                                                color: Colors.green,
                                                size: 24,
                                              ),
                                              label: const Text(
                                                'Adicionar',
                                                style: TextStyle(fontSize: 12),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: TextButton.icon(
                                              onPressed: () {},
                                              icon: const Icon(
                                                Icons.remove,
                                                color: Colors.redAccent,
                                                size: 24,
                                              ),
                                              label: const Text(
                                                'Remover',
                                                style: TextStyle(fontSize: 12),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: TextButton.icon(
                                              onPressed: () {},
                                              icon: const Icon(
                                                Icons.delete,
                                                color: Colors.black,
                                                size: 24,
                                              ),
                                              label: const Text(
                                                'Excluir',
                                                style: TextStyle(fontSize: 12),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                backgroundColor: isOpen
                                    ? Color.fromARGB(255, 32, 59, 117)
                                    : Color.fromARGB(255, 38, 75, 145),
                              ),
                            ],
                          );
                        },
                      );
                    }),
                  ),
                ),
              ),
              // BOTÃO ADICIONAR MATÉRIA CORRIGIDO
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF4FAAFF),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 16,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, '/cadastrarMateria');
                  },
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.add_box_rounded,
                        color: Colors.white,
                        size: 28,
                      ),
                      SizedBox(width: 8),
                      Text(
                        "Adicionar Matéria",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
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
                // Já está na tela de Faltas
              },
              child: const Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.class_sharp, color: Color(0xFF4FAAFF)),
                  Text(
                    "Faltas",
                    style: TextStyle(color: Color(0xFF4FAAFF), fontSize: 12),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
