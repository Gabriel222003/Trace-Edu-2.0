import 'package:flutter/material.dart';
import '../Models/ModelMateria.dart';
import 'ControllerMateria.dart';

class ControllerCadastrarMateria {
  final ControllerMateria controllerMateria = ControllerMateria(1);

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
}
