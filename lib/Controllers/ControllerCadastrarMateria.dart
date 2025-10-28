import '../repositories/materia_repository.dart'; // <- onde está o getMateriasPorUsuario()

class ControllerCadastrarMateria {
  final MateriaRepository _repo = MateriaRepository();

  void adiconarMateria(String nomeMateria, int horas, int horaAula, int idUsuario, int qtdFaltas){

    _repo.adicionarMateria(
      {
        "idMateria": 0,
        "nomeMateria": nomeMateria,
        "horas": horas,
        "horaAula": horaAula,
        "idUsuario": idUsuario,
        "qtdFaltas": qtdFaltas
      }
    );


  }


  /*
  final ControllerMateria controllerMateria = ControllerMateria();

  ModelMateria? validarMateria(
    TextEditingController nomeController,
    TextEditingController presencaController,
    TextEditingController faltasController,
  ) {
    if (nomeController.text.isEmpty ||
        presencaController.text.isEmpty ||
        faltasController.text.isEmpty) {
      return null;
    }
  }


  void adicionarMateria(
    BuildContext context,
    TextEditingController nomeController,
    TextEditingController presencaController,
    TextEditingController faltasController,
  ) {
    final materia = validarMateria(
      nomeController,
      presencaController,
      faltasController,
    );

    if (materia == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Por favor, preencha todos os campos!')),
      );
      return;
    }
    Navigator.pop(context, materia);
  }

  */
}
