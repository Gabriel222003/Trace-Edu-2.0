import 'package:flutter/material.dart';
import 'package:trace_edu/Componentes/TriceText.dart';
import 'package:trace_edu/Componentes/TriceTextField.dart';
import 'package:trace_edu/providers/usuario_provider.dart';
import 'package:trace_edu/repositories/usuario_repository.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController senhaController = TextEditingController();
  final UsuarioRepository usuario = UsuarioRepository();

  @override
  void dispose() {
    emailController.dispose();
    senhaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const TriceText(
                label: 'Login',
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
              const SizedBox(height: 40.0),
              TriceTextField(
                label: 'E-mail',
                icon: Icons.email,
                keyboardType: TextInputType.emailAddress,
                controller: emailController, // 👈 conecta o controller
              ),
              const SizedBox(height: 16.0),
              TriceTextField(
                label: 'Senha',
                icon: Icons.lock,
                obscureText: true,
                controller: senhaController, // 👈 conecta o controller
              ),
              const SizedBox(height: 24.0),
              ElevatedButton(
                onPressed: () async {
                  final email = emailController.text.trim();
                  final senha = senhaController.text.trim();

                  // Aqui você pode chamar o login da API
                  if (email.isNotEmpty && senha.isNotEmpty) {
                    print('Email: $email, Senha: $senha');
                    await usuario.configurarToken();
                    if(await usuario.login(email, senha)){
                      Navigator.pushReplacementNamed(context, '/telaInicial');
                    }else{
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Preencha todos os campos')));
                    }
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Preencha todos os campos')),
                    );
                  }
                },
                child: const Text('Entrar'),
              ),
              const SizedBox(height: 16.0),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/registrar');
                },
                child: const TriceText(
                  label: 'Cadastrar',
                  fontSize: 16,
                  color: Colors.white,
                  decoration: TextDecoration.underline,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
