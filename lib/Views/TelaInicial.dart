import 'package:flutter/material.dart';
import 'package:trace_edu/Models/ModelMateria.dart';
import 'package:trace_edu/Controllers/ControllerMateria.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:trace_edu/Views/Configuracoes.dart';
import 'package:trace_edu/Views/Faltas.dart';
import 'package:trace_edu/Views/PerfildoAluno.dart';
import '../Componentes/TriceText.dart';
import '../Componentes/TriceBuildNavButton.dart';
import '../Componentes/TriceBottomNavigationBar.dart';

class TelaInicial extends StatefulWidget {
  final ControllerMateria controllerMateria = ControllerMateria(1);

  TelaInicial({super.key});

  @override
  _TelaInicialState createState() => _TelaInicialState();
}

class _TelaInicialState extends State<TelaInicial> {
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
                        final novaMateria = await Navigator.pushNamed(
                          context,
                          '/cadastrarMateria',
                        );

                        if (novaMateria != null &&
                            novaMateria is ModelMateria) {
                          setState(() {
                            // <-- ESSENCIAL: atualiza o gráfico
                            widget.controllerMateria.adicionaMateria(
                              novaMateria,
                            );
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
                  child: Container(
                    padding: const EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [Colors.lightBlue, Colors.blue],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    /* GRÁFICO MELHORADO */
                    child: BarChart(
                      BarChartData(
                        alignment: BarChartAlignment.spaceEvenly,
                        maxY: 100,
                        groupsSpace: widget.controllerMateria.tamanho > 6
                            ? 20
                            : 40, // espaçamento dinâmico
                        barGroups: List.generate(
                          widget.controllerMateria.tamanho > 10
                              ? 10
                              : widget.controllerMateria.tamanho,
                          (y) {
                            return BarChartGroupData(
                              x: y,
                              barRods: [
                                BarChartRodData(
                                  toY: widget.controllerMateria.presenca[y],
                                  color: widget.controllerMateria
                                      .criaPilaresGraficos()[y],
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
                              getTitlesWidget: (value, meta) => TriceText(
                                label: '${value.toInt()}%',
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ),
                          bottomTitles: AxisTitles(
                            sideTitles: SideTitles(
                              showTitles: true,
                              reservedSize: 60, // mais espaço para texto
                              getTitlesWidget: (value, meta) {
                                final index = value.toInt();
                                if (index <
                                        widget
                                            .controllerMateria
                                            .listaMaterias
                                            .length &&
                                    index < 10) {
                                  // pega nome e reduz se for muito longo
                                  String nome = widget
                                      .controllerMateria
                                      .listaMaterias[index]
                                      .nomeMateria;
                                  if (nome.length > 12) {
                                    nome = nome.substring(0, 10) + '...';
                                  }
                                  return Transform.rotate(
                                    angle: -0.5, // ~30° em radianos
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 8.0),
                                      child: TriceText(
                                        label: nome,
                                        textAlign: TextAlign.center,
                                        color: Colors.white,
                                        fontSize: 11,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                  );
                                }
                                return const SizedBox.shrink();
                              },
                            ),
                          ),
                          topTitles: const AxisTitles(
                            sideTitles: SideTitles(showTitles: false),
                          ),
                          rightTitles: const AxisTitles(
                            sideTitles: SideTitles(showTitles: false),
                          ),
                        ),
                        gridData: const FlGridData(show: false),
                        borderData: FlBorderData(show: false),
                      ),
                    ),
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
