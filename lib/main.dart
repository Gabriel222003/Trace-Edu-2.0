import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'firebase_options.dart';
import 'screens/login_screen.dart';
import 'screens/register_screen.dart';
import 'screens/home_screen.dart';
import 'screens/add_subject_screen.dart';
import 'screens/welcome_screen.dart';
import 'screens/main_screen.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  final bool isFirstTime = prefs.getBool('isFirstTime') ?? true;
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
    );

  runApp(MyApp(isFirstTime: isFirstTime));
}

class MyApp extends StatelessWidget {
  final bool isFirstTime;

  const MyApp({super.key, required this.isFirstTime});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Projeto Flutter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: isFirstTime ? const WelcomeScreen() : const LoginScreen(),
      routes: {
        '/register': (context) => const RegisterScreen(),
        '/main': (context) => const MainScreen(),
        '/add_subject': (context) => const AddSubjectScreen(),
        '/welcome': (context) => const WelcomeScreen(),
      },
    );
  }
}
