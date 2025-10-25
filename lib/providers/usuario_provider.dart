import 'package:flutter/material.dart';
import '../repositories/usuario_repository.dart';

class UsuarioProvider extends ChangeNotifier {
  final UsuarioRepository _repo = UsuarioRepository();
  List<dynamic> usuarios = [];
  bool carregando = false;

  Future<void> carregarUsuarios() async {
    carregando = true;
    notifyListeners();
    usuarios = await _repo.getUsuarios();
    carregando = false;
    notifyListeners();
  }
}
