import 'package:flutter/material.dart';

class PerfildoAluno extends StatefulWidget {
  const PerfildoAluno({super.key});

  @override
  State<PerfildoAluno> createState() => _PerfildoAlunoState();
}

class _PerfildoAlunoState extends State<PerfildoAluno> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue,
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "Perfil do Aluno",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          // Foto e nome do aluno
          ListTile(
            leading: CircleAvatar(
              radius: 30,
              backgroundColor: Colors.blueGrey[800],
              child: const Icon(Icons.person, size: 35, color: Colors.white),
            ),
            title: const Text(
              "Nome do Aluno",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: const Text(
              "Curso:\nSemestre:",
              style: TextStyle(color: Colors.white, fontSize: 14),
            ),
          ),
          Divider(color: Colors.white),
          // Editar Perfil
          ListTile(
            leading: Icon(Icons.edit, color: Colors.white),
            title: const Text(
              "Editar Perfil",
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
            onTap: () {
              // alguma coisa aqui
            },
          ),
          Divider(color: Colors.white),
          // Progresso Acadêmico - Faltas
          ListTile(
            leading: Icon(Icons.event_busy, color: Colors.white),
            title: const Text(
              "Faltas",
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
            subtitle: const Text("Ver detalhes das faltas"),
            onTap: () {
              // alguma coisa aqui
            },
          ),
          Divider(color: Colors.white),
          // Progresso Acadêmico - Notas
          ListTile(
            leading: Icon(Icons.grade, color: Colors.white),
            title: const Text(
              "Notas",
              style: TextStyle(color:Colors.white, fontSize: 16),
            ),
            subtitle: const Text("Ver notas acadêmicas"),
            onTap: () {
              // alguma coisa aqui
            },
          ),
          Divider(color: Colors.white),
          // Progresso Acadêmico - Certificados
          ListTile(
            leading: Icon(Icons.star, color: Colors.white),
            title: const Text(
              "Certificados",
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
            subtitle: const Text("Ver certificados obtidos"),
            onTap: () {
              // alguma coisa aqui
            },
          ),
          Divider(color:Colors.white),
          // Histórico de Certificações
          ListTile(
            leading: Icon(Icons.history, color: Colors.white),
            title: const Text(
              "Histórico de Certificações",
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
            subtitle: const Text("Ver certificações passadas"),
            onTap: () {
              // alguma coisa aqui
            },
          ),
        ],
      ),
    );
  }
}
