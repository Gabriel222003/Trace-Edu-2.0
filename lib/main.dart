import 'package:flutter/material.dart';
import 'package:trace_edu/routes.dart';
import 'Views/Login.dart';
import 'Views/BemVindo.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'firebase_options.dart';



void main() async {
  runApp(MyApp(true));
}

class MyApp extends StatelessWidget {
  final bool isFirstTime;

  const MyApp(this.isFirstTime);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Projeto Flutter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.lightBlue, // cor de fundo clara e agradável
        textTheme: ThemeData.light().textTheme.apply(
          decoration: TextDecoration.none, // remove underline de todos os textos
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.lightBlue,
          elevation: 0,
          titleTextStyle: const TextStyle(
            color: Colors.white,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),

        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.white, // cor do fundo do campo de texto
          hintStyle: TextStyle(color: Colors.grey[600]), // cor do texto de dica
          labelStyle: TextStyle(color: Colors.blueAccent), // cor do label
          prefixIconColor: Colors.blue, // ícones dentro do TextField
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: Colors.blueAccent),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: Colors.blue, width: 2),
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue.shade600,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 24),
          ),
        ),
      ),
      home: isFirstTime ? const Bemvindo() : const Login(),
      onGenerateRoute: Routes.onGenerateRoute,
    );
  }
}
