import 'package:flutter/material.dart';

class TelaConfiguracoes extends StatefulWidget {
  const TelaConfiguracoes({super.key});

  @override
  State<TelaConfiguracoes> createState() => _TelaConfiguracoesState();
}

class _TelaConfiguracoesState extends State<TelaConfiguracoes> {
  bool alertMaterias = false;
  bool alertFaltas = false;
  bool fonteGrande = false;
  bool temaEscuro = false;
  bool temaClaro = false;
  bool ingles = false;
  bool portugues = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1B263B),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1B263B),
        elevation: 0,
        title: const Text(
          "Configurações",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        centerTitle: false,
      ),
      body: ListView(
        children: [
          // Seção: Notificações
          ListTile(
            leading: Icon(Icons.notifications, color: Colors.white70),
            title: const Text(
              "Notificações",
              style: TextStyle(
                color: Colors.lightBlueAccent,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Divider(color: Colors.white30),
          SwitchListTile(
            title: const Text(
              "Receber alerta das matérias",
              style: TextStyle(color: Colors.white),
            ),
            value: alertMaterias,
            activeColor: Colors.lightBlueAccent,
            onChanged: (val) {
              setState(() {
                alertMaterias = val;
              });
            },
          ),
          Divider(color: Colors.white30),
          SwitchListTile(
            title: const Text(
              "Receber alerta das faltas",
              style: TextStyle(color: Colors.white),
            ),
            value: alertFaltas,
            activeColor: Colors.lightBlueAccent,
            onChanged: (val) {
              setState(() {
                alertFaltas = val;
              });
            },
          ),
          Divider(color: Colors.white30),
          // Seção: Acessibilidade
          ListTile(
            leading: Icon(Icons.accessibility, color: Colors.white70),
            title: const Text(
              "Acessibilidade",
              style: TextStyle(
                color: Colors.lightBlueAccent,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Divider(color: Colors.white30),
          CheckboxListTile(
            title: const Text(
              "Fonte grande",
              style: TextStyle(color: Colors.white),
            ),
            value: fonteGrande,
            activeColor: Colors.lightBlueAccent,
            onChanged: (val) {
              setState(() {
                fonteGrande = val!;
              });
            },
          ),
          Divider(color: Colors.white30),
          CheckboxListTile(
            title: const Text(
              "Tema escuro",
              style: TextStyle(color: Colors.white),
            ),
            value: temaEscuro,
            activeColor: Colors.lightBlueAccent,
            onChanged: (val) {
              setState(() {
                temaEscuro = val!;
                if (val) temaClaro = false;
              });
            },
          ),
          Divider(color: Colors.white30),
          CheckboxListTile(
            title: const Text(
              "Tema claro",
              style: TextStyle(color: Colors.white),
            ),
            value: temaClaro,
            activeColor: Colors.lightBlueAccent,
            onChanged: (val) {
              setState(() {
                temaClaro = val!;
                if (val) temaEscuro = false;
              });
            },
          ),
          Divider(color: Colors.white30),
          // Seção: Linguagem
          ListTile(
            leading: Icon(Icons.language, color: Colors.white70),
            title: const Text(
              "Linguagem",
              style: TextStyle(
                color: Colors.lightBlueAccent,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Divider(color: Colors.white30),
          CheckboxListTile(
            title: const Text("Inglês", style: TextStyle(color: Colors.white)),
            value: ingles,
            activeColor: Colors.lightBlueAccent,
            onChanged: (val) {
              setState(() {
                ingles = val!;
                if (val) portugues = false;
              });
            },
          ),
          Divider(color: Colors.white30),
          CheckboxListTile(
            title: const Text(
              "Português",
              style: TextStyle(color: Colors.white),
            ),
            value: portugues,
            activeColor: Colors.lightBlueAccent,
            onChanged: (val) {
              setState(() {
                portugues = val!;
                if (val) ingles = false;
              });
            },
          ),
          Divider(color: Colors.white30),
          // Seção: Zona de perigo
          ListTile(
            leading: Icon(Icons.warning, color: Colors.white70),
            title: const Text(
              "Zona de perigo",
              style: TextStyle(
                color: Colors.lightBlueAccent,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Divider(color: Colors.white30),
          ListTile(
            leading: Icon(Icons.logout, color: Colors.redAccent),
            title: const Text(
              "Sair",
              style: TextStyle(color: Colors.redAccent, fontSize: 16),
            ),
            onTap: () {
              // ação de sair
            },
          ),
          Divider(color: Colors.white30),
          // Botão Salvar
          ListTile(
            title: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF4FAAFF),
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onPressed: () {
                // ação de salvar
              },
              child: const Text(
                "Salvar",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
      // Barra inferior
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xFF1B263B),
        selectedItemColor: const Color(0xFF4FAAFF),
        unselectedItemColor: Colors.white70,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Menu"),
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
