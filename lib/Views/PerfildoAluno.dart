import 'package:flutter/material.dart';
import 'package:trace_edu/Views/Configuracoes.dart';
import 'package:trace_edu/Views/Faltas.dart';
import 'package:trace_edu/Views/TelaInicial.dart';
import 'EditarPerfil.dart';
import 'package:shared_preferences/shared_preferences.dart';

// import 'package:image_picker/image_picker.dart'; // Adicione esta dependência ao pubspec.yaml: image_picker: ^1.0.4
// import 'dart:io'; // Para File
// import 'AdicionarCertificado.dart';
// import 'HistoricoCertificacoes.dart';

// class Certificado {
//   String nome;
//   String descricao;
//   File? imagem; // Usando File para armazenar a imagem selecionada
//
//   Certificado({required this.nome, required this.descricao, this.imagem});
// }

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
  // List<Certificado> certificados = [];

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
        ],
      ),

      bottomNavigationBar: Container(
        color: const Color(0xFF1B263B),
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.transparent,
                elevation: 0,
              ),
              onPressed: () {
                // Navegar para Menu
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TelaInicial()),
                );
              },
              child: const Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.home, color: Colors.white70),
                  Text(
                    "Menu",
                    style: TextStyle(color: Colors.white70, fontSize: 12),
                  ),
                ],
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.transparent,
                elevation: 0,
              ),
              onPressed: () {
                // Navegar para Configurações
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TelaConfiguracoes()),
                );
              },
              child: const Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.settings, color: Colors.white70),
                  Text(
                    "Configurações",
                    style: TextStyle(color: Colors.white70, fontSize: 12),
                  ),
                ],
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.transparent,
                elevation: 0,
              ),
              onPressed: () {
                // Navegar para Perfil
              },
              child: const Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.person, color: Color(0xFF4FAAFF)),
                  Text(
                    "Perfil",
                    style: TextStyle(color: Color(0xFF4FAAFF), fontSize: 12),
                  ),
                ],
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.transparent,
                elevation: 0,
              ),
              onPressed: () {
                // Navegar para Faltas
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Faltas()),
                );
              },
              child: const Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.class_sharp, color: Colors.white70),
                  Text(
                    "Faltas",
                    style: TextStyle(color: Colors.white70, fontSize: 12),
                  ),
                ],
              ),
            ),

            // const Divider(color: Colors.white),
            // Progresso Acadêmico - Certificados
            // ListTile(
            //   leading: const Icon(Icons.star, color: Colors.white),
            //   title: const Text(
            //     "Certificados",
            //     style: TextStyle(color: Colors.white, fontSize: 16),
            //   ),
            //   subtitle: const Text("Adicionar certificados"),
            //   onTap: () async {
            //     final certificado = await Navigator.push(
            //       context,
            //       MaterialPageRoute(
            //         builder: (context) => AdicionarCertificadoScreen(),
            //       ),
            //     );
            //     if (certificado != null) {
            //       setState(() {
            //         certificados.add(certificado);
            //       });
            //     }
            //   },
            // ),
            // const Divider(color: Colors.white),

            // Histórico de Certificações
            // ListTile(
            //   leading: const Icon(Icons.history, color: Colors.white),
            //   title: const Text(
            //     "Histórico de Certificações",
            //     style: TextStyle(color: Colors.white, fontSize: 16),
            //   ),
            //   subtitle: const Text("Ver certificações passadas"),
            //   onTap: () {
            //     Navigator.push(
            //       context,
            //       MaterialPageRoute(
            //         builder: (context) => HistoricoCertificacoesScreen(
            //           certificados: certificados,
            //         ),
            //       ),
            //     );
            //   },
            // ),
          ],
        ),
      ),
    );
  }
}
