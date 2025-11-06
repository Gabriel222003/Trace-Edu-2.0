import 'package:dio/dio.dart';
import '../core/api_client.dart';
import '../Models/ModelMateria.dart';

class MateriaRepository {
  final Dio _dio = ApiClient.dio;

  Future<List<ModelMateria>> getMateriasPorUsuario(int idUsuario) async {
    final response = await _dio.get(
      '/api/Materia/GetMateriasPorUsuario',
      queryParameters: {'idUsuario': idUsuario},
    );

    if(response.statusCode == 200){
      List dados = response.data;
      return dados.map((elementos) => ModelMateria.fromJson(elementos)).toList();
    }else{
      throw Exception('Erro ao carregar dados');
    }
    
  }

  Future<void> adicionarMateria(Map<String, dynamic> dados) async {
    await _dio.post('/api/Materia/PostAdicionarMateria', data: dados);
  }

  Future<void> atualizarMateria(Map<String, dynamic> dados, int idUsuario) async {
    await _dio.put('/api/Materia/PutAtualizarMateria', data: dados, queryParameters: {'idUsuario': idUsuario});
  }

  Future<void> atualizarFaltas(Map<String, dynamic> dados, int idUsuario) async {
    await _dio.post('/api/Materia/PostAtualizarFaltas', data: dados, queryParameters: {'idUsuario': idUsuario});
  }

  Future<void> deletarMateria(int idMateria, int idUsuario) async {
    await _dio.delete('/api/Materia/DeleteMateria', queryParameters: {'idMateria': idMateria, 'idUsuario': idUsuario});
  }
}
