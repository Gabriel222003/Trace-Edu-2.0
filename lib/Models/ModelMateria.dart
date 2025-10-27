
class ModelMateria {
  final int idMateria;
  final String nomeMateria;
  final int horas;
  final int horaAula;
  final int idUsuario;
  final int qtdFaltas;
  final double calcularPercentualFaltas;

  ModelMateria({
    required this.idMateria,
    required this.nomeMateria,
    required this.horas,
    required this.horaAula,
    required this.qtdFaltas,
    required this.idUsuario,
    required this.calcularPercentualFaltas,
  });

  factory ModelMateria.fromJson(Map<String, dynamic> json){
    return ModelMateria(
      idMateria: json['idMateria'],
      nomeMateria: json['nomeMateria'], 
      horas: json['horas'], 
      horaAula: json['horaAula'],
      idUsuario: json['idUsuario'],
      qtdFaltas: json['qtdFaltas'],
      calcularPercentualFaltas: json['calcularPercentualFaltas'],
      );
  }
}