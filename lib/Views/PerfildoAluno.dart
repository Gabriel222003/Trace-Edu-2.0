import 'package:flutter/material.dart';
//import 'package:image_picker/image_picker.dart'; // Adicione esta dependência ao pubspec.yaml: image_picker: ^1.0.4
import 'dart:io'; // Para File

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
                  builder: (context) => HistoricoCertificacoesScreen(certificados: certificados),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

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
  late TextEditingController nomeController;
  late TextEditingController cursoController;
  late TextEditingController semestreController;

  @override
  void initState() {
    super.initState();
    nomeController = TextEditingController(text: widget.nomeAtual);
    cursoController = TextEditingController(text: widget.cursoAtual);
    semestreController = TextEditingController(text: widget.semestreAtual);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue,
      appBar: AppBar(
        title: const Text("Editar Perfil"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(26.0),
        child: Column(
          children: [
            TextField(
                controller: nomeController,
                decoration: const InputDecoration(labelText: 'Nome do Aluno')),
            const SizedBox(height: 12),
            TextField(controller: cursoController, decoration: const InputDecoration(labelText: 'Curso')),
            const SizedBox(height: 12),
            TextField(controller: semestreController, decoration: const InputDecoration(labelText: 'Semestre')),
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

// Tela para adicionar certificado
class AdicionarCertificadoScreen extends StatefulWidget {
  const AdicionarCertificadoScreen({super.key});

  @override
  State<AdicionarCertificadoScreen> createState() => _AdicionarCertificadoScreenState();
}

class _AdicionarCertificadoScreenState extends State<AdicionarCertificadoScreen> {
  final TextEditingController nomeController = TextEditingController();
  final TextEditingController descricaoController = TextEditingController();
  File? imagemSelecionada;

 // Future<void> _selecionarImagem() async {
   // final picker = ImagePicker();
    //final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    //if (pickedFile != null) {
      //setState(() {
        //imagemSelecionada = File(pickedFile.path);
      //});
    //}
  //}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue,
      appBar: AppBar(
        title: const Text("Adicionar Certificado"),
        actions: [
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: () {
              if (nomeController.text.isNotEmpty && descricaoController.text.isNotEmpty) {
                final certificado = Certificado(
                  nome: nomeController.text,
                  descricao: descricaoController.text,
                  imagem: imagemSelecionada,
                );
                Navigator.pop(context, certificado);
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Preencha nome e descrição")),
                );
              }
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: nomeController,
              decoration: const InputDecoration(labelText: "Nome do Certificado"),
            ),
            TextField(
              controller: descricaoController,
              decoration: const InputDecoration(labelText: "Descrição"),
              maxLines: 3,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: (){
                // -selecionarimagem
              },
              child: const Text("Selecionar Imagem"),
            ),
            if (imagemSelecionada != null)
              Image.file(imagemSelecionada!, height: 100),
          ],
        ),
      ),
    );
  }
}

// Tela para histórico de certificações
class HistoricoCertificacoesScreen extends StatelessWidget {
  final List<Certificado> certificados;

  const HistoricoCertificacoesScreen({super.key, required this.certificados});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.lightBlue,
        appBar: AppBar(
        title: const Text("Histórico de Certificações"),
      ),
      body: certificados.isEmpty
          ? const Center(child: Text("Nenhum certificado adicionado."))
          : ListView.builder(
        itemCount: certificados.length,
        itemBuilder: (context, index) {
          final cert = certificados[index];
          return ListTile(
            leading: cert.imagem != null
                ? Image.file(cert.imagem!, width: 50, height: 50, fit: BoxFit.cover)
                : const Icon(Icons.image),
            title: Text(cert.nome),
            subtitle: Text(cert.descricao),
          );
        },
      ),
    );
  }
}