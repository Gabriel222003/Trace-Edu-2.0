import 'package:dio/dio.dart';
import '../core/api_client.dart';

class UsuarioRepository {
  final Dio _dio = ApiClient.dio;

  Future<List<dynamic>> getUsuarios() async {
    final response = await _dio.get('/api/Usuario/GetUsuarios');
    return response.data;
  }

  Future<Map<String, dynamic>> login(String email, String senha) async {
    final response = await _dio.post('/api/Usuario/Login', data: {
      'email': email,
      'senha': senha,
    });
    return response.data;
  }

  Future<void> adicionarUsuario(Map<String, dynamic> dados) async {
    await _dio.post('/api/Usuario/PostAdicionarUsuario', data: dados);
  }

  Future<void> atualizarUsuario(Map<String, dynamic> dados) async {
    await _dio.put('/api/Usuario/PutAtualizarUsuario', data: dados);
  }

  Future<void> deletarUsuario(int id) async {
    await _dio.delete('/api/Usuario/DeleteDesativarUsuario', queryParameters: {'id': id});
  }
}
