import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:trace_edu/Models/ModelMateria.dart';

class ControllerMateria {
  List<int> falta = [];
  List<double> presenca = [];
  List<String> nomes = [];
  List<ModelMateria> listaMaterias = [];
  int tamanho = 0;

  ControllerMateria() {
    _carregaMaterias();
  }

  void _carregaMaterias() {
    listaMaterias = [
      ModelMateria(nome: 'Arqui. de Computadores', presenca: 100, faltas: 0),
      ModelMateria(nome: 'Extensão III', presenca: 60, faltas: 40),
      ModelMateria(nome: 'Controle', presenca: 70, faltas: 30),
      ModelMateria(nome: 'Redes I', presenca: 90, faltas: 10),
      ModelMateria(nome: 'Programação III', presenca: 80, faltas: 20),
    ];
    tamanho = listaMaterias.length;
    nomes = listaMaterias.map((m) => m.nome).toList();
    presenca = listaMaterias.map((m) => m.presenca.toDouble()).toList();
    falta = listaMaterias.map((m) => m.faltas).toList();
  }

  void adicionaMateria(ModelMateria materia) {
    listaMaterias.add(materia);
    nomes.add(materia.nome);
    presenca.add(materia.presenca.toDouble());
    falta.add(materia.faltas);
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
}
