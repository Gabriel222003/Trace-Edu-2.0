import 'package:flutter/material.dart';
import '../Views/Login.dart';
import '../Views/BemVindo.dart';
import '../Views/Registro.dart';
import '../Views/CadastrarMateria.dart';
import '../Views/TelaInicial.dart';

class Routes {
  static Map<String, WidgetBuilder> routes = { 
    '/registrar': (contenxt) => Registro(),
    '/login': (context) => const Login(),
    '/bemVindo': (context) => const Bemvindo(),
    '/cadastrarMateria': (context) => const CadastrarMateria(),
    '/telaInicial': (context) => TelaInicial(),

  };
}