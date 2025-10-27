import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:dio/dio.dart';
import 'package:trace_edu/Models/Autentica%C3%A7%C3%A3o.dart';
import 'package:trace_edu/Models/ModelUsuario.dart';
import '../core/api_client.dart';

class UsuarioRepository {
  final Dio _dio = ApiClient.dio;
  final storage = const FlutterSecureStorage();
  

  Future<List<ModelUsuario>> getUsuarios() async {
    final response = await _dio.get('/api/Usuario/GetUsuarios');

    if(response.statusCode == 200){
      List dados = response.data;
      return dados.map((elementos) => ModelUsuario.fromJson(elementos)).toList();
    }else{
      throw Exception('Erro ao carregar dados');
    }
  }

  Future<List<ModelUsuario>> getUsuariosId(int idUsuario) async {
    final response = await _dio.get('/api/Usuario/GetUsuarios',
    queryParameters: {
      'id': idUsuario 
    });
    
    if(response.statusCode == 200){
      List dados = response.data;
      return dados.map((elementos) => ModelUsuario.fromJson(elementos)).toList();
    }else{
      throw Exception('Erro ao carregar dados');
    }
  }

  Future<bool> login(String email, String senha) async {
    final response = await _dio.post('/api/Usuario/Login', data: {
      'email': email,
      'senha': senha,
    });

    if(response.statusCode == 200){
      final data = jsonDecode(response.data);
      final autenticacao = Autenticacao.fromJson(data);
      await storage.write(key: 'jwt', value: autenticacao.token);
      return true;
    }else {
        throw Exception('Falha no login: ${response.statusCode}');
      }
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

  Future<void> configurarToken() async {
  final token = await storage.read(key: 'jwt');
  if (token != null) {
    _dio.options.headers['Authorization'] = 'Bearer $token';
  }
}

}
