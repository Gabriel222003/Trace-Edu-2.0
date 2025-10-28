import '../repositories/usuario_repository.dart';
import '../Models/ModelUsuario.dart';

class ControllerEditarPerfil{
  final UsuarioRepository _repo = UsuarioRepository();

  Future<List<ModelUsuario>> getUsuariosId(int idUsuario){
    return _repo.getUsuariosId(idUsuario);
  }
}