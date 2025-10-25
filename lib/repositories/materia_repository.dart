import 'package:dio/dio.dart';
import '../core/api_client.dart';

class MateriaRepository {
  final Dio _dio = ApiClient.dio;

  Future<List<dynamic>> getMateriasPorUsuario(int idUsuario) async {
    final response = await _dio.get(
      '/api/Materia/GetMateriasPorUsuario',
      queryParameters: {'idUsuario': idUsuario},
    );
    return response.data;
  }

  Future<void> adicionarMateria(Map<String, dynamic> dados) async {
    await _dio.post('/api/Materia/PostAdicionarMateria', data: dados);
  }

  Future<void> atualizarMateria(Map<String, dynamic> dados) async {
    await _dio.put('/api/Materia/PutAtualizarMateria', data: dados);
  }

  Future<void> atualizarFaltas(Map<String, dynamic> dados) async {
    await _dio.post('/api/Materia/PostAtualizarFaltas', data: dados);
  }

  Future<void> deletarMateria(int idMateria) async {
    await _dio.delete('/api/Materia/DeleteMateria', queryParameters: {'idMateria': idMateria});
  }
}
