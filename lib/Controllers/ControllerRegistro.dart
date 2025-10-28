import 'package:flutter/material.dart';
import '../repositories/usuario_repository.dart';

class ControllerRegistro {
  final UsuarioRepository _repo = UsuarioRepository();

  bool validarCampos(
      BuildContext context, TextEditingController nome, TextEditingController email, TextEditingController senha, TextEditingController confirmarSenha) {
    
    if (nome.text.isEmpty || email.text.isEmpty || senha.text.isEmpty || confirmarSenha.text.isEmpty) {
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

    if (senha.text != confirmarSenha.text){
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Senha diferente')),
      );
      return false;
    }

    return true;
  }

  void registrarUsuario(
      BuildContext context, TextEditingController nome, TextEditingController email, TextEditingController senha, TextEditingController confirmarSenha) {
    if (validarCampos(context, nome, email, senha, confirmarSenha)) {

      _repo.adicionarUsuario({
        'idUsuario': 0,
        'nomeUsuario': nome.text,
        'login': email.text,
        'senha': senha.text,
        'tipoUsuario': 1,
        'ativo': true,
      });
      // Aqui no futuro você vai chamar o servidor.
      // Por enquanto, pode simular o sucesso:
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Usuário ${nome.text} registrado com sucesso!')),
      );

      Navigator.pop(context);
    }
  }
}
