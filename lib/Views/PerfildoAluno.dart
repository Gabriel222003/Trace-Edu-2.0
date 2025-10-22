import 'package:flutter/material.dart';

class StudentProfileScreen extends StatelessWidget {
  const StudentProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
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
              child: const Icon(Icons.person, size: 35, color: Colors.white70),
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
              style: TextStyle(color: Colors.white70, fontSize: 14),
            ),
          ),
          Divider(color: Colors.white30),
          // Editar Perfil
          ListTile(
            leading: Icon(Icons.edit, color: Colors.white70),
            title: const Text(
              "Editar Perfil",
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
            onTap: () {
              // alguma coisa aqui
            },
          ),
          Divider(color: Colors.white30),
          // Progresso Acadêmico - Faltas
          ListTile(
            leading: Icon(Icons.event_busy, color: Colors.white70),
            title: const Text(
              "Faltas",
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
            subtitle: const Text("Ver detalhes das faltas"),
            onTap: () {
              // alguma coisa aqui
            },
          ),
          Divider(color: Colors.white30),
          // Progresso Acadêmico - Notas
          ListTile(
            leading: Icon(Icons.grade, color: Colors.white70),
            title: const Text(
              "Notas",
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
            subtitle: const Text("Ver notas acadêmicas"),
            onTap: () {
              // alguma coisa aqui
            },
          ),
          Divider(color: Colors.white30),
          // Progresso Acadêmico - Certificados
          ListTile(
            leading: Icon(Icons.star, color: Colors.white70),
            title: const Text(
              "Certificados",
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
            subtitle: const Text("Ver certificados obtidos"),
            onTap: () {
              // alguma coisa aqui
            },
          ),
          Divider(color: Colors.white30),
          // Progresso Acadêmico - Reconhecimentos
          ListTile(
            leading: Icon(Icons.favorite, color: Colors.white70),
            title: const Text(
              "Reconhecimentos",
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
            subtitle: const Text("Ver reconhecimentos recebidos"),
            onTap: () {
              // alguma coisa aqui
            },
          ),
          Divider(color: Colors.white30),
          // Histórico de Certificações
          ListTile(
            leading: Icon(Icons.history, color: Colors.white70),
            title: const Text(
              "Histórico de Certificações",
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
            subtitle: const Text("Ver certificações passadas"),
            onTap: () {
              // alguma coisa aqui
            },
          ),
          Divider(color: Colors.white30),
          // Item do histórico 1
          ListTile(
            leading: Icon(Icons.check_circle_outline, color: Colors.white70),
            title: const Text(
              "Certificado de Conclusão de Curso",
              style: TextStyle(color: Colors.white70, fontSize: 14),
            ),
          ),
          // Item do histórico 2
          ListTile(
            leading: Icon(Icons.check_circle_outline, color: Colors.white70),
            title: const Text(
              "Certificado de Participação em Evento",
              style: TextStyle(color: Colors.white70, fontSize: 14),
            ),
          ),
          // Item do histórico 3
          ListTile(
            leading: Icon(Icons.check_circle_outline, color: Colors.white70),
            title: const Text(
              "Certificação de Mérito Acadêmico",
              style: TextStyle(color: Colors.white70, fontSize: 14),
            ),
          ),
        ],
      ),
      // Barra inferior (menu)
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xFF1B263B),
        selectedItemColor: const Color(0xFF4FAAFF),
        unselectedItemColor: Colors.white70,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.menu), label: "Menu"),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: "Configurações",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Perfil"),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: "Notificações",
          ),
        ],
      ),
    );
  }
}
