import 'package:flutter/material.dart';
import 'package:trace_edu/Views/Faltas.dart';
//import 'package:image_picker/image_picker.dart'; // Adicione esta dependência ao pubspec.yaml: image_picker: ^1.0.4
//import 'dart:io'; // Para File
import 'EditarPerfil.dart';
//import 'AdicionarCertificado.dart';
//import 'HistoricoCertificacoes.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Classe para representar um certificado
//class Certificado {
//String nome;
//String descricao;
//File? imagem; // Usando File para armazenar a imagem selecionada

// Certificado({required this.nome, required this.descricao, this.imagem});
//}

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

  // Chaves para o SharedPreferences
  static const String nomeKey = 'nome';
  static const String cursoKey = 'curso';
  static const String semestreKey = 'semestre';

  // Lista de certificados
  //List<Certificado> certificados = [];

  @override
  void initState() {
    super.initState();
    _carregarDadosSalvos();
  }

  // Método para carregar os dados salvos
  Future<void> _carregarDadosSalvos() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      setState(() {
        nome = prefs.getString(nomeKey) ?? "";
        curso = prefs.getString(cursoKey) ?? "";
        semestre = prefs.getString(semestreKey) ?? "";
      });
    } catch (e) {
      print("Erro ao carregar dados: $e");
    }
  }

  // Método para salvar os dados
  Future<void> _salvarDados() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(nomeKey, nome);
      await prefs.setString(cursoKey, curso);
      await prefs.setString(semestreKey, semestre);
    } catch (e) {
      print("Erro ao salvar dados: $e");
    }
  }

  // Método para atualizar os dados quando voltar da tela de edição
  void _atualizarDados(Map<String, String> novosDados) async {
    setState(() {
      nome = novosDados['nome'] ?? nome;
      curso = novosDados['curso'] ?? curso;
      semestre = novosDados['semestre'] ?? semestre;
    });
    await _salvarDados();
  }

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
                _atualizarDados(result);
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
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Faltas()),
              );
            },
          ),
          // const Divider(color: Colors.white),
          // Progresso Acadêmico - Certificados
          //  ListTile(
          //   leading: const Icon(Icons.star, color: Colors.white),
          //   title: const Text(
          //    "Certificados",
          //    style: TextStyle(color: Colors.white, fontSize: 16),
          //  ),
          // subtitle: const Text("Adicionar certificados"),
          // onTap: () async {
          // Navegar para a tela de adição de certificado
          //  final certificado = await Navigator.push(
          //   context,
          //  MaterialPageRoute(
          //    builder: (context) => AdicionarCertificadoScreen(),
          //),
          //);
          //if (certificado != null) {
          //setState(() {
          // certificados.add(certificado);
          //});
          //}
          //},
          //),
          //const Divider(color: Colors.white),
          // Histórico de Certificações
          //ListTile(
          //leading: const Icon(Icons.history, color: Colors.white),
          //title: const Text(
          //"Histórico de Certificações",
          //style: TextStyle(color: Colors.white, fontSize: 16),
          //),
          //subtitle: const Text("Ver certificações passadas"),
          //onTap: () {
          // Navegar para a tela de histórico
          //Navigator.push(
          //context,
          //MaterialPageRoute(
          //builder: (context) =>
          //  HistoricoCertificacoesScreen(certificados: certificados),
          //),
          //);
          //},
          //),
        ],
      ),
    );
  }
}
