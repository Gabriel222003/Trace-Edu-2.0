class Autenticacao {
  final String token;

  Autenticacao({required this.token});

  factory Autenticacao.fromJson(Map<String, dynamic> json) {
    return Autenticacao(
      token: json['token'] ?? '', // 'token' é a chave que sua API retorna
    );
  }
}
