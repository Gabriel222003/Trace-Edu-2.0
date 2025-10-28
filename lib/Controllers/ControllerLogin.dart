import 'package:flutter/material.dart';
import '../repositories/usuario_repository.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';


class Controllerlogin {
  final UsuarioRepository _repo = UsuarioRepository();
  final storage = const FlutterSecureStorage();
  late String email;
  late String senha;
  late String? idUsuario;

  Future<bool> validarCampos(BuildContext context, String email, String senha) async {
    if (email.isNotEmpty && senha.isNotEmpty) {
      try {
        bool sucesso = await _repo.login(email, senha); // ✅ await aqui
        return sucesso;
      } catch (e) {
        if (!context.mounted) return false;
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('E-mail ou Senha incorretos!!!'))
        );
        return false;
      }
    } else {
      if (!context.mounted) return false;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Preencha todos os campos'))
      );
      return false;
    }
  }

  void login(BuildContext context, TextEditingController email, TextEditingController senha) async{
    if(await validarCampos(context, email.text.trim(), senha.text.trim())){
      idUsuario = await storage.read(key: 'idUsuario');
    }
    if (!context.mounted) return;
    _repo.configurarToken();
    Navigator.pushReplacementNamed(context, '/telaInicial', arguments: idUsuario,);
    

    // Aqui você pode chamar o login da API
    
  }
}