import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:trace_edu/Models/ModelMateria.dart';
import '../repositories/materia_repository.dart';

class FaltasController extends ChangeNotifier {
  final MateriaRepository _repo = MateriaRepository();
  final BuildContext context;
  final storage = const FlutterSecureStorage();

  List<ModelMateria> listaMaterias = [];

  FaltasController(this.context);

  // 🔹 Carrega todas as matérias do usuário
  Future<void> carregarDados(int idUsuario) async {
    try {
      listaMaterias = await _repo.getMateriasPorUsuario(idUsuario);
      notifyListeners();
    } catch (e) {
      debugPrint('Erro ao carregar matérias: $e');
      if (!context.mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Erro ao carregar matérias')),
      );
    }
  }

  // 🔹 Adiciona 1 falta e atualiza no banco
  Future<void> adicionarFalta(int idMateria, int idUsuario) async {
    final index = listaMaterias.indexWhere((m) => m.idMateria == idMateria);
    if (index != -1) {
      final materia = listaMaterias[index];
      listaMaterias[index] = materia.copyWith(qtdFaltas: materia.qtdFaltas + 1);
      print("-----------------estou aqui----------------");
       print(materia.qtdFaltas);
      await _repo.atualizarFaltas({
        "idMateria": materia.idMateria,
        "nomeMateria": "",
        "horas": 0,
        "horaAula": 0,
        "qtdFaltas": materia.qtdFaltas + 1,
      },
        idUsuario
      );

      notifyListeners();
    }
  }

  Future<void> removerFalta(int idMateria, int idUsuario) async {
    final index = listaMaterias.indexWhere((m) => m.idMateria == idMateria);
    if (index != -1 && listaMaterias[index].qtdFaltas > 0) {
      final materia = listaMaterias[index];
      listaMaterias[index] = materia.copyWith(qtdFaltas: materia.qtdFaltas - 1);
      print("-----------------estou aqui----------------");
      print(materia.qtdFaltas);
      await _repo.atualizarFaltas({
        "idMateria": materia.idMateria,
        "nomeMateria": "",
        "horas": materia.horas,
        "horaAula": materia.horaAula,
        "qtdFaltas": materia.qtdFaltas - 1,
      },
        idUsuario
      );

      notifyListeners();
    }
  }

  Future<void> excluirMateria(int idMateria, int idUsuario) async {
    await _repo.deletarMateria(idMateria, idUsuario);
    listaMaterias.removeWhere((m) => m.idMateria == idMateria);
    notifyListeners();
  }

}
