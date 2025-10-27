import 'package:flutter/material.dart';
import '../Componentes/TriceText.dart';
import '../Componentes/TriceBottomNavigationBar.dart';
import 'package:trace_edu/Views/Configuracoes.dart';
import 'package:trace_edu/Views/PerfildoAluno.dart';
import 'package:trace_edu/Views/TelaInicial.dart';

class Faltas extends StatelessWidget {
  const Faltas({super.key});

  @override
  Widget build(BuildContext context) {
    
    List<String> nomesMaterias = ['AED', 'IoT', 'Extensão IV', 'Proj. Embarcados', 'Proj. Computação'];
    final List<ValueNotifier<bool>> openPanels = List.generate(nomesMaterias.length, (_) => ValueNotifier(false));
    List<Widget> listaMaterias = [];
    
    List<Widget> addMateria(){
      listaMaterias.add(
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 3),
        )
      );
      listaMaterias.add(
        SingleChildScrollView(
          child: Column(
            spacing: 5,
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
                                color: Color.fromARGB(255, 108, 193, 232),
                              ),
                            ),
                          );
                        },
                        body: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            /*Elementos do dropdwown*/
                            children:  [
                              Text("Gerencie suas faltas:", style: TextStyle(fontWeight: FontWeight.bold, color:Color.fromARGB(255, 108, 193, 232))),
                              TextButton.icon(
                                onPressed: () {},
                                icon: const Icon(Icons.add, color: Colors.green, size: 35,weight: 45),
                                label: const Text(''),
                              ),
                              TextButton.icon(
                                onPressed: () {},
                                icon: const Icon(Icons.remove, color: Colors.redAccent, size: 35,weight: 45),
                                label: const Text(''),
                              ),
                              TextButton.icon(
                                onPressed: () {},
                                icon: const Icon(Icons.delete, color: Colors.black, size: 35, weight: 45),
                                label: const Text(''),
                              ),
                            ],
                          ),
                        ),
                        backgroundColor: isOpen ? Color.fromARGB(255, 32, 59, 117) : Color.fromARGB(255, 38, 75, 145)
                      ),
                    ],
                  );
                },
              );
            })
          )
        )
      ); 
      listaMaterias.add(
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: SizedBox(
            width: 50,
            height: 50,
            child: TextButton.icon(
              icon: const Icon(Icons.add_box_rounded, color: Color.fromARGB(255, 26, 217, 33),size: 45, weight: 45),
              label: const Text(''),
              onPressed: () => Navigator.pushNamed(context, '/cadastrarMateria'),
            ),
          ),
        ),
      );
    return listaMaterias;
    }


    return Scaffold(
      backgroundColor: Colors.lightBlue,
      appBar: AppBar(
        title: Text("Gerenciar Matérias"),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: addMateria()
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
                  Text("Menu", style: TextStyle(color: Colors.white70, fontSize: 12)),
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
                  Text("Configurações", style: TextStyle(color: Colors.white70, fontSize: 12)),
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
                  Text("Perfil", style: TextStyle(color: Colors.white70, fontSize: 12)),
                ],
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.transparent,
                elevation: 0,
              ),
              onPressed: () {
                // Navegar para Notas
              },
              child: const Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.grade, color: Colors.white70),
                  Text("Notas", style: TextStyle(color: Colors.white70, fontSize: 12)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}