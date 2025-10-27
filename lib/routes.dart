import 'package:flutter/material.dart';
import 'package:trace_edu/Views/PerfildoAluno.dart';
import '../Views/Login.dart';
import '../Views/BemVindo.dart';
import '../Views/Registro.dart';
import '../Views/CadastrarMateria.dart';
import '../Views/TelaInicial.dart';
import '../Views/Configuracoes.dart';
import '../Views/Faltas.dart';

class Routes {
  static Map<String, WidgetBuilder> routes = {
    '/registrar': (contenxt) => Registro(),
    '/login': (context) => const Login(),
    '/bemVindo': (context) => const Bemvindo(),
    '/cadastrarMateria': (context) => const CadastrarMateria(),
    '/telaInicial': (context) => TelaInicial(),
    '/configuracoes': (context) => TelaConfiguracoes(),
    '/Aluno': (context) => PerfildoAluno(),
    '/faltas': (context) => const Faltas(),
  };
}
