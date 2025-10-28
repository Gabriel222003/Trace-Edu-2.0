class Autenticacao {
  final String token;
  final String id;

  Autenticacao({required this.token, required this.id});

  factory Autenticacao.fromJson(Map<String, dynamic> json) {
    return Autenticacao(
      token: json['token'] ?? '', // 'token' é a chave que sua API retorna
      id: json['idUsuario'].toString(), // 'token' é a chave que sua API retorna
    );
  }
}
