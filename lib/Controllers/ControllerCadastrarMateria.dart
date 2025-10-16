import 'package:flutter/material.dart';
import '../Models/ModelMateria.dart';

class ControllerCadastrarMateria {
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

    return ModelMateria(
      nome: nomeController.text,
      presenca: int.tryParse(presencaController.text) ?? 0,
      faltas: int.tryParse(faltasController.text) ?? 0,
    );
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
