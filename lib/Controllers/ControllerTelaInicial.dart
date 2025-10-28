import 'package:flutter/material.dart';
import '../Models/ModelMateria.dart';
import '../repositories/materia_repository.dart'; // <- onde está o getMateriasPorUsuario()

class ControllerTelaInicial extends ChangeNotifier {
  final MateriaRepository _repo = MateriaRepository();

  List<ModelMateria> listaMaterias = [];
  List<double> presenca = [];
  List<Color> cores = [];
  int tamanho = 0;

  /// Carrega as matérias do usuário e prepara os dados do gráfico
  Future<void> carregarMaterias(int idUsuario) async {
    try {
      listaMaterias = await _repo.getMateriasPorUsuario(idUsuario);
      tamanho = listaMaterias.length;

      // Monta a lista de presenças e cores com base no percentual
      presenca = listaMaterias
          .map((m) => m.calcularPercentualFaltas)
          .toList();

      cores = listaMaterias.map((m) {
        final p = 100 - m.calcularPercentualFaltas;
        if (p < 25) return Colors.redAccent;
        if (p < 80) return Colors.yellowAccent;
        return Colors.green;
      }).toList();

      notifyListeners();
    } catch (e) {
      print('Erro ao carregar matérias: $e');
    }
  }

  /// Gera as cores para os pilares (chamada no gráfico)
  List<Color> criaPilaresGraficos() {
    return cores;
  }
}
