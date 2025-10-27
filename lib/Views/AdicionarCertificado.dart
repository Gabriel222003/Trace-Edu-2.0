/*import 'package:flutter/material.dart';
//import 'package:image_picker/image_picker.dart'; // Adicione esta dependência ao pubspec.yaml: image_picker: ^1.0.4
import 'dart:io'; // Para File
import 'PerfildoAluno.dart';

// Tela para adicionar certificado
class AdicionarCertificadoScreen extends StatefulWidget {
  const AdicionarCertificadoScreen({super.key});

  @override
  State<AdicionarCertificadoScreen> createState() =>
      _AdicionarCertificadoScreenState();
}

class _AdicionarCertificadoScreenState
    extends State<AdicionarCertificadoScreen> {
  final TextEditingController nomeController = TextEditingController();
  final TextEditingController descricaoController = TextEditingController();
  File? imagemSelecionada;

  Future<void> _selecionarImagem() async {
    // final picker = ImagePicker();
    // final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    // if (pickedFile != null) {
    //   setState(() {
    //     imagemSelecionada = File(pickedFile.path);
    //   });
    // }
  }

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
              if (nomeController.text.isNotEmpty &&
                  descricaoController.text.isNotEmpty) {
               /* final certificado = Certificado(
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
              decoration: const InputDecoration(
                labelText: "Nome do Certificado",
              ),
            ),
            TextField(
              controller: descricaoController,
              decoration: const InputDecoration(labelText: "Descrição"),
              maxLines: 3,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _selecionarImagem,
              child: const Text("Selecionar Imagem"),
            ),
            if (imagemSelecionada != null)
              Image.file(imagemSelecionada!, height: 100), */
         ],
       ),
      ),
      )
   // );
  }
}*/
