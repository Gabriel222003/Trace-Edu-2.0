import 'package:flutter/material.dart';
import 'package:trace_edu/Models/ModelMateria.dart';
import 'package:trace_edu/Controllers/ControllerMateria.dart';
import 'package:fl_chart/fl_chart.dart';

class TelaInicial extends StatefulWidget {
  final ControllerMateria controllerMateria = ControllerMateria();

  TelaInicial({super.key,});

  @override
  _TelaInicialState createState() => _TelaInicialState();
}

class _TelaInicialState extends State<TelaInicial> {

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.lightBlue, Colors.blue],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Bem-vindo ao Trace-Edu',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontFamily: 'Roboto',
                  shadows: [
                    Shadow(
                      blurRadius: 8.0,
                      color: Colors.blueAccent,
                      offset: Offset(2.0, 2.0),
                    ),
                  ],
                ),
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
                  _buildNavButton(
                    context,
                    icon: Icons.calendar_today,
                    label: 'Faltas',
                    onTap: () {
                       // Navega para a aba Faltas
                    },
                  ),
                  _buildNavButton(
                    context,
                    icon: Icons.book,
                    label: 'Notas',
                    onTap: () {
                       // Navega para a aba Notas
                    },
                  ),
                  _buildNavButton(
                    context,
                    icon: Icons.edit,
                    label: 'Matérias',
                    // Pensar na lógica que tenho que executar aqui 
                    onTap: () async {
                      // Navega para a tela de adicionar matéria (Vai dar erro pois falta a tela )
                      final novaMateria = await Navigator.pushNamed(
                        context,
                        '/cadastrarMateria',
                      );
                      if (novaMateria != null && novaMateria is ModelMateria) {
                        /* PRECIOSO CRIAR UM METODO QUE COLOCA UM NOVO VALOR NA LISTA DE MATÉRIAS.
                              ------------------- aqui ---------------------------------          
                        */

                        // Método que não deve estar na View?? Conversar com o Erick!!!!
                        widget.controllerMateria.adicionaMateria(novaMateria);
                      }
                    },
                  ),
                  _buildNavButton(
                    context,
                    icon: Icons.menu,
                    label: 'Menu',
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Menu - A ser implementado')),
                      );
                    },
                  ),
                ],
              ),
              const SizedBox(height: 24.0),
              const Text(
                'Métricas de Desempenho',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
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
                  /*GRÁFICOOOOOOOOOOOOOO*/
                  child: BarChart(
                    BarChartData(
                      alignment: BarChartAlignment.spaceAround,
                      maxY: 100,
                      barGroups: List.generate(widget.controllerMateria.tamanho, (y){
                        return BarChartGroupData(
                          x: y,
                          barRods: [
                              BarChartRodData(toY: widget.controllerMateria.presenca[y], color: widget.controllerMateria.criaPilaresGraficos()[y], width: 20, borderRadius: BorderRadius.circular(20)),
                          ]
                        );
                      }),
                      titlesData: FlTitlesData(
                        leftTitles: AxisTitles(
                          sideTitles: SideTitles(
                            showTitles: true,
                            reservedSize: 40,
                            getTitlesWidget: (value, meta) {
                              return Text(
                                '${value.toInt()}%',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                ),
                              );
                            },
                          ),
                        ),
                        bottomTitles: AxisTitles(
                          sideTitles: SideTitles(
                            showTitles: true,
                            getTitlesWidget: (meta, value) {
                              final index = meta.toInt();
                              if (index < widget.controllerMateria.tamanho) {
                                return Padding(
                                  padding: const EdgeInsets.only(top: 8.0),
                                  child: Text(
                                    widget.controllerMateria.listaMaterias[index].nome,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                    ),
                                  ),
                                );
                              }
                              return const Text('');
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
    );
  }

  Widget _buildNavButton(BuildContext context, {required IconData icon, required String label, required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.0),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 4.0,
              offset: Offset(2.0, 2.0),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 32,
              color: Colors.blue,
            ),
            const SizedBox(height: 8.0),
            Text(
              label,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.blue,
              ),
            ),
          ],
        ),
      ),
    );
  }
}