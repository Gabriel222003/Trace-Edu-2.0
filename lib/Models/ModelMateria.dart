class ModelMateria {
  final int idMateria;
  final String nomeMateria;
  final int horas;
  final int horaAula;
  final int idUsuario;
  int qtdFaltas;
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

  factory ModelMateria.fromJson(Map<String, dynamic> json) {
    return ModelMateria(
      idMateria: json['idMateria'],
      nomeMateria: json['nomeMateria'],
      horas: json['horas'],
      horaAula: json['horaAula'],
      qtdFaltas: json['qtdFaltas'],
      idUsuario: json['idUsuario'],
      calcularPercentualFaltas:
          (json['calcularPercentualFaltas'] ?? 0).toDouble(),
    );
  }

  // ✅ Método copyWith adicionado
  ModelMateria copyWith({
    int? idMateria,
    String? nomeMateria,
    int? horas,
    int? horaAula,
    int? idUsuario,
    int? qtdFaltas,
    double? calcularPercentualFaltas,
  }) {
    return ModelMateria(
      idMateria: idMateria ?? this.idMateria,
      nomeMateria: nomeMateria ?? this.nomeMateria,
      horas: horas ?? this.horas,
      horaAula: horaAula ?? this.horaAula,
      idUsuario: idUsuario ?? this.idUsuario,
      qtdFaltas: qtdFaltas ?? this.qtdFaltas,
      calcularPercentualFaltas:
          calcularPercentualFaltas ?? this.calcularPercentualFaltas,
    );
  }
}
