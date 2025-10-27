class ModelUsuario {
  final int idUsuario;
  final String nomeUsuario;
  final String login;
  final String senha;
  final int tipoUsuario;
  final bool ativo;

  ModelUsuario({
    required this.idUsuario,
    required this.nomeUsuario,
    required this.login,
    required this.senha,
    required this.tipoUsuario,
    required this.ativo,
    
  });

  factory ModelUsuario.fromJson(Map<String, dynamic> json){
    return ModelUsuario(
      idUsuario: json['idUsuario'],
      nomeUsuario: json['nomeUsuario'], 
      login: json['login'], 
      senha: json['senha'],
      tipoUsuario: json['tipoUsuario'],
      ativo: json['ativo'],
      );
  }
}