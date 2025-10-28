import 'package:trace_edu/repositories/materia_repository.dart';

class ControllerMateria {
  final String token = "";
  









  /*
  final MateriaRepository materias = MateriaRepository();
  List<int> falta = [];
  List<double> presenca = [];
  List<String> nomes = [];
  List<ModelMateria> listaMaterias = [];
  int tamanho = 0;

  ControllerMateria(int idUsuario) {
    _carregaMaterias(idUsuario);
  }

  void _carregaMaterias(int idUsuario) async{
    final listaMaterias = await materias.getMateriasPorUsuario(idUsuario);
    tamanho = listaMaterias.length;
    nomes = listaMaterias.map((m) => m.nomeMateria).toList();
    presenca = listaMaterias.map((m) => m.horaAula.toDouble()).toList();
    falta = listaMaterias.map((m) => m.qtdFaltas).toList();
  }

  void adicionaMateria(ModelMateria materia) {
    listaMaterias.add(materia);
    nomes.add(materia.nomeMateria);
    presenca.add(materia.horaAula.toDouble());
    falta.add(materia.qtdFaltas);
    tamanho++;
  }

  List<Color> criaPilaresGraficos() {
    List<Color> cores = [];

    for (int i = 0; i < presenca.length; i++) {
      Color cor;
      if (presenca[i] >= 75) {
        cor = Colors.greenAccent;
      } else if (presenca[i] >= 50) {
        cor = Colors.yellowAccent;
      } else {
        cor = Colors.redAccent;
      }
      cores.add(cor);
    }

    return cores;
  }
  */
}
