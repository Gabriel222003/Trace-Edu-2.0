import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../Views/Login.dart';
import '../Views/BemVindo.dart';
import '../Views/Registro.dart';
import '../Views/CadastrarMateria.dart';
import '../Views/TelaInicial.dart';
import '../Views/Configuracoes.dart';
import '../Views/Faltas.dart';
import '../Views/PerfildoAluno.dart';

class Routes {
  static final storage = FlutterSecureStorage();

  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/registrar':
        return MaterialPageRoute(builder: (_) => Registro());
      case '/login':
        return MaterialPageRoute(builder: (_) => const Login());
      case '/bemVindo':
        return MaterialPageRoute(builder: (_) => const Bemvindo());
      case '/cadastrarMateria':
        return MaterialPageRoute(builder: (_) => const CadastrarMateria());
      case '/telaInicial':
        final idUsuario = int.parse(settings.arguments as String);
        return MaterialPageRoute(builder: (_) => TelaInicial(idUsuario: idUsuario));
      case '/configuracoes':
        return MaterialPageRoute(builder: (_) => TelaConfiguracoes());
      case '/Aluno':
        return MaterialPageRoute(builder: (_) => PerfildoAluno());
      case '/faltas':
        return MaterialPageRoute(builder: (_) => const Faltas());
    }
    return null;
  }
}
