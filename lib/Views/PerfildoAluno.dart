import 'package:flutter/material.dart';
//import 'package:image_picker/image_picker.dart'; // Adicione esta dependência ao pubspec.yaml: image_picker: ^1.0.4
import 'dart:io'; // Para File
import 'EditarPerfil.dart';
import 'AdicionarCertificado.dart';
import 'HistoricoCertificacoes.dart';

// Classe para representar um certificado
class Certificado {
  String nome;
  String descricao;
  File? imagem; // Usando File para armazenar a imagem selecionada

  Certificado({required this.nome, required this.descricao, this.imagem});
}

class PerfildoAluno extends StatefulWidget {
  const PerfildoAluno({super.key});

  @override
  State<PerfildoAluno> createState() => _PerfildoAlunoState();
}

class _PerfildoAlunoState extends State<PerfildoAluno> {
  // Variáveis de estado para os dados do perfil
  String nome = "";
  String curso = "";
  String semestre = "";

  // Lista de certificados
  List<Certificado> certificados = [];

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
          // Foto e nome do aluno (agora dinâmico)
          ListTile(
            leading: CircleAvatar(
              radius: 30,
              backgroundColor: Colors.blueGrey[800],
              child: const Icon(Icons.person, size: 35, color: Colors.white),
            ),
            title: Text(
              nome,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(
              "Curso: $curso\nSemestre: $semestre",
              style: const TextStyle(color: Colors.white, fontSize: 14),
            ),
          ),
          const Divider(color: Colors.white),
          // Editar Perfil
          ListTile(
            leading: const Icon(Icons.edit, color: Colors.white),
            title: const Text(
              "Editar Perfil",
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
            onTap: () async {
              // Navegar para a tela de edição e aguardar o resultado
              final result = await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EditarPerfilScreen(
                    nomeAtual: nome,
                    cursoAtual: curso,
                    semestreAtual: semestre,
                  ),
                ),
              );
              if (result != null) {
                setState(() {
                  nome = result['nome'];
                  curso = result['curso'];
                  semestre = result['semestre'];
                });
              }
            },
          ),
          const Divider(color: Colors.white),
          // Progresso Acadêmico - Faltas
          ListTile(
            leading: const Icon(Icons.event_busy, color: Colors.white),
            title: const Text(
              "Faltas",
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
            subtitle: const Text("Ver detalhes das faltas"),
            onTap: () {
              // alguma coisa aqui
            },
          ),
          const Divider(color: Colors.white),
          // Progresso Acadêmico - Notas
          ListTile(
            leading: const Icon(Icons.grade, color: Colors.white),
            title: const Text(
              "Notas",
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
            subtitle: const Text("Ver notas acadêmicas"),
            onTap: () {
              // alguma coisa aqui
            },
          ),
          const Divider(color: Colors.white),
          // Progresso Acadêmico - Certificados
          ListTile(
            leading: const Icon(Icons.star, color: Colors.white),
            title: const Text(
              "Certificados",
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
            subtitle: const Text("Adicionar certificados"),
            onTap: () async {
              // Navegar para a tela de adição de certificado
              final certificado = await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AdicionarCertificadoScreen(),
                ),
              );
              if (certificado != null) {
                setState(() {
                  certificados.add(certificado);
                });
              }
            },
          ),
          const Divider(color: Colors.white),
          // Histórico de Certificações
          ListTile(
            leading: const Icon(Icons.history, color: Colors.white),
            title: const Text(
              "Histórico de Certificações",
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
            subtitle: const Text("Ver certificações passadas"),
            onTap: () {
              // Navegar para a tela de histórico
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      HistoricoCertificacoesScreen(certificados: certificados),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
