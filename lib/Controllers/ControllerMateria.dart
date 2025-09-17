import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:trace_edu/Models/ModelMateria.dart';

class ControllerMateria {
  late List<int> falta;
  late List<double> presenca;
  late List<String> nomes;
  
  void getMaterias(){
    /*Lista de matérias*/ 
    List<ModelMateria> subjects = [
      ModelMateria(nome: 'Arqui. de Computadores', presenca: 100, faltas: 0),
      ModelMateria(nome: 'Extensão III', presenca: 60, faltas: 40),
      ModelMateria(nome: 'Controle', presenca: 70, faltas: 30),
      ModelMateria(nome: 'Redes I', presenca: 90, faltas: 10),
      ModelMateria(nome: 'Programação III', presenca: 80, faltas: 20),
    ]; 
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
  }
}
