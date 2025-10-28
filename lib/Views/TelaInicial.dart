import 'package:flutter/material.dart';
import 'package:trace_edu/Controllers/ControllerTelaInicial.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:trace_edu/Views/Configuracoes.dart';
import 'package:trace_edu/Views/Faltas.dart';
import 'package:trace_edu/Views/PerfildoAluno.dart';
import '../Componentes/TriceText.dart';
import '../Componentes/TriceBuildNavButton.dart';
import 'CadastrarMateria.dart';
//import '../Componentes/TriceBottomNavigationBar.dart';

class TelaInicial extends StatefulWidget {
  final int idUsuario; // ← você pode passar esse ID ao navegar

  const TelaInicial({required this.idUsuario, super.key});

  @override
  State<TelaInicial> createState() => _TelaInicialState();
}

class _TelaInicialState extends State<TelaInicial> {
  final controller = ControllerTelaInicial(); // sua controller
  late Future<void> futureMaterias;

  @override
  void initState() {
    super.initState();
    // Chama o carregamento assim que a tela abre
    print("Aqui esta o que eu quero--------------------------------------------------");
    print(widget.idUsuario);
    futureMaterias = controller.carregarMaterias(widget.idUsuario);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.lightBlue, Colors.blue],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 16.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const TriceText(
                  label: "TraceEdu 🎓",
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
                const SizedBox(height: 24.0),
                GridView.count(
                  crossAxisCount: 2,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisSpacing: 16.0,
                  mainAxisSpacing: 16.0,
                  childAspectRatio: 1.5,
                  children: [
                    TriceBuildNavButton(
                      icon: Icons.calendar_today,
                      label: 'Faltas',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Faltas(),
                          ),
                        );
                      },
                    ),
                    TriceBuildNavButton(
                      icon: Icons.book,
                      label: 'Perfil',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PerfildoAluno(),
                          ),
                        );
                      },
                    ),
                    TriceBuildNavButton(
                      icon: Icons.edit,
                      label: 'Cadastrar Matérias',
                      onTap: () async {
                        final result = await Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const CadastrarMateria()),
                        );

                        if (result == true) {
                          setState(() {
                            // Recarrega as matérias e atualiza o gráfico
                            controller.carregarMaterias(widget.idUsuario);
                          });
                        }
                      },

                    ),
                    TriceBuildNavButton(
                      icon: Icons.settings,
                      label: 'Configurações',
                      onTap: () {
                        Navigator.pushNamed(context, '/configuracoes');
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 24.0),
                const TriceText(
                  label: 'Métricas de Desempenho',
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
                const SizedBox(height: 16.0),
                 Expanded(
                  child: FutureBuilder<void>(
                    future: futureMaterias, // ✅ usa o Future inicializado
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(
                          child: CircularProgressIndicator(color: Colors.white),
                        );
                      } else if (snapshot.hasError) {
                        return Center(
                          child: Text('Erro ao carregar dados', style: const TextStyle(color: Colors.white)),
                        );
                      } else {
                        // ✅ Dados carregados, constrói o gráfico
                        return Container(
                          padding: const EdgeInsets.all(16.0),
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              colors: [Colors.lightBlue, Colors.blue],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                            ),
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          child: BarChart(
                            BarChartData(
                              alignment: BarChartAlignment.spaceEvenly,
                              maxY: 100,
                              groupsSpace: controller.tamanho > 6 ? 20 : 40,
                              barGroups: List.generate(
                                controller.tamanho,
                                (i) {
                                  return BarChartGroupData(
                                    x: i,
                                    barRods: [
                                      BarChartRodData(
                                        toY: double.parse((100 - controller.presenca[i]).toStringAsPrecision(3)),
                                        color: controller.cores[i],
                                        width: 22,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ],
                                  );
                                },
                              ),
                              titlesData: FlTitlesData(
                                leftTitles: AxisTitles(
                                  sideTitles: SideTitles(
                                    showTitles: true,
                                    reservedSize: 40,
                                    getTitlesWidget: (value, meta) => Text(
                                      '${value.toInt()}%',
                                      style: const TextStyle(color: Colors.white, fontSize: 12),
                                    ),
                                  ),
                                ),
                                bottomTitles: AxisTitles(
                                  sideTitles: SideTitles(
                                    showTitles: true,
                                    reservedSize: 60,
                                    getTitlesWidget: (value, meta) {
                                      final index = value.toInt();
                                      if (index < controller.listaMaterias.length) {
                                        String nome = controller.listaMaterias[index].nomeMateria;
                                        if (nome.length > 12) nome = nome.substring(0, 10) + '...';
                                        return Transform.rotate(
                                          angle: -0.5,
                                          child: Padding(
                                            padding: const EdgeInsets.only(top: 8.0),
                                            child: Text(
                                              nome,
                                              textAlign: TextAlign.center,
                                              style: const TextStyle(color: Colors.white, fontSize: 11),
                                            ),
                                          ),
                                        );
                                      }
                                      return const SizedBox.shrink();
                                    },
                                  ),
                                ),
                                topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                                rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                              ),
                              gridData: const FlGridData(show: false),
                              borderData: FlBorderData(show: false),
                            ),
                          ),
                        );
                      }
                    },
                  ),
                ),

              ],
            ),
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
              },
              child: const Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.home, color: Color(0xFF4FAAFF)),
                  Text(
                    "Menu",
                    style: TextStyle(color: Color(0xFF4FAAFF), fontSize: 12),
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
                  MaterialPageRoute(builder: (context) => const Faltas()),
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
    );
  }
}
