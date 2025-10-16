import 'package:flutter/material.dart';
import 'package:trace_edu/routes.dart';
import 'Views/Login.dart';
import 'Views/BemVindo.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'firebase_options.dart';



void main() async {
  runApp(MyApp(false));
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
      ),
      home: isFirstTime ? const Bemvindo() : const Login(),
      routes: Routes.routes,
      
    );
  }
}
