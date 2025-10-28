import 'package:flutter/material.dart';
import '../Models/ModelUsuario.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:trace_edu/Controllers/ControllerEditarPerfil.dart'; // Para File

// Tela para editar o perfil
class EditarPerfilScreen extends StatefulWidget {
  final String nomeAtual;
  final String cursoAtual;
  final String semestreAtual;

  const EditarPerfilScreen({
    super.key,
    required this.nomeAtual,
    required this.cursoAtual,
    required this.semestreAtual,
  });

  @override
  State<EditarPerfilScreen> createState() => _EditarPerfilScreenState();
}

class _EditarPerfilScreenState extends State<EditarPerfilScreen> {
  final storage = const FlutterSecureStorage();
  final ControllerEditarPerfil controller = ControllerEditarPerfil();
  late TextEditingController nomeController;
  late TextEditingController cursoController;
  late TextEditingController semestreController;

  @override
  void initState() {
    super.initState();
    nomeController = TextEditingController(text: widget.nomeAtual);
    cursoController = TextEditingController(text: widget.cursoAtual);
    semestreController = TextEditingController(text: widget.semestreAtual);
    carregarUsuario();
  }

  Future<void> carregarUsuario() async {
    final idUsuario = await storage.read(key: 'idUsuario');
    if (idUsuario == null) return;

    List<ModelUsuario> usuarios = await controller.getUsuariosId(int.parse(idUsuario));

    if (usuarios.isNotEmpty) {
      final usuario = usuarios.first;

      // Atualiza os controllers com os dados do usuário
      setState(() {
        nomeController.text = usuario.nomeUsuario;      // atribui o nome

      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue,
      appBar: AppBar(title: const Text("Editar Perfil")),
      body: Padding(
        padding: const EdgeInsets.all(26.0),
        child: Column(
          children: [
            TextField(
              controller: nomeController,
              decoration: const InputDecoration(labelText: 'Nome do Aluno'),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: cursoController,
              decoration: const InputDecoration(labelText: 'Curso'),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: semestreController,
              decoration: const InputDecoration(labelText: 'Semestre'),
            ),
            const SizedBox(height: 24.0),
            IconButton(
              icon: const Icon(Icons.save),
              onPressed: () {
                Navigator.pop(context, {
                  'nome': nomeController.text,
                  'curso': cursoController.text,
                  'semestre': semestreController.text,
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
