import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:trace_edu/Models/ModelMateria.dart';

class ControllerMateria {
  late List<int> falta;
  late List<double> presenca;
  late List<String> nomes;
  late List<ModelMateria> listaMaterias;
  late int tamanho = 0;
  
  List<ModelMateria> getMaterias(){
    // Aqui vai ter uma requisição para o servidor, onde vai ser mostrado os dados 
    /*Lista de matérias*/ 
    List<ModelMateria> subjects = [
      ModelMateria(nome: 'Arqui. de Computadores', presenca: 100, faltas: 0),
      ModelMateria(nome: 'Extensão III', presenca: 60, faltas: 40),
      ModelMateria(nome: 'Controle', presenca: 70, faltas: 30),
      ModelMateria(nome: 'Redes I', presenca: 90, faltas: 10),
      ModelMateria(nome: 'Programação III', presenca: 80, faltas: 20),
    ];

    listaMaterias = subjects;
    tamanho = subjects.length;

    return subjects;
  }

  void adicionaMateria(ModelMateria materia){
    listaMaterias.add(materia);
    tamanho++;
  }

  List<Color> criaPilaresGraficos(){
    List<ModelMateria> subjects = getMaterias();  

    //Conversar com o André sobre as logicas de cores e como elas está aparecendo na tela inicial 

    /*Mover subjects para vetor*/
    nomes = subjects.map((no) => no.nome).toList();
    presenca = subjects.map((pres) => pres.presenca.toDouble()).toList();
    falta = subjects.map((fal) => fal.presenca).toList();
    /*Criação do vetor das cores*/
    List<Color> cor(){
      Color t;
      List<Color> cores = [];
      for(int q = 0;q<presenca.length;q++){
        if(presenca[q]>=50){
          t =  Colors.white;
        }else if (presenca[q]<=50 || presenca[q]>=25){
          t =  Colors.yellowAccent;
        }
        else{
          t = Colors.red;
        }
        cores.add(t);
      }
      return cores;
    } 
    return cor();
  }
}
