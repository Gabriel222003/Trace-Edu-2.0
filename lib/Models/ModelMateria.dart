class ModelMateria {
  final String nome;
  final int presenca;
  final int faltas;

  ModelMateria({
    required this.nome,
    required this.presenca,
    required this.faltas,
  });

  double getAttendancePercentage() {
    final total = presenca + faltas;
    return total == 0 ? 0 : (presenca / total) * 100;
  }
}