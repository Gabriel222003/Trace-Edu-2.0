import 'package:flutter/material.dart';

class ControllerRegistro {
  bool validarCampos(
      BuildContext context, TextEditingController nome, TextEditingController email, TextEditingController senha) {
    
    if (nome.text.isEmpty || email.text.isEmpty || senha.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Preencha todos os campos!')),
      );
      return false;
    }

    if (!email.text.contains('@')) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('E-mail inválido!')),
      );
      return false;
    }

    return true;
  }

  void registrarUsuario(
      BuildContext context, TextEditingController nome, TextEditingController email, TextEditingController senha) {
    if (validarCampos(context, nome, email, senha)) {
      // Aqui no futuro você vai chamar o servidor.
      // Por enquanto, pode simular o sucesso:
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Usuário ${nome.text} registrado com sucesso!')),
      );

      Navigator.pop(context);
    }
  }
}
