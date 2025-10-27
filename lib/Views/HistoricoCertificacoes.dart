import 'package:flutter/material.dart';
import 'PerfildoAluno.dart';
import 'dart:io'; // Para File

// Tela para histórico de certificações
class HistoricoCertificacoesScreen extends StatelessWidget {
  final List<Certificado> certificados;

  const HistoricoCertificacoesScreen({super.key, required this.certificados});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue,
      appBar: AppBar(title: const Text("Histórico de Certificações")),
      body: certificados.isEmpty
          ? const Center(child: Text("Nenhum certificado adicionado."))
          : ListView.builder(
              itemCount: certificados.length,
              itemBuilder: (context, index) {
                final cert = certificados[index];
                return ListTile(
                  leading: cert.imagem != null
                      ? Image.file(
                          cert.imagem!,
                          width: 50,
                          height: 50,
                          fit: BoxFit.cover,
                        )
                      : const Icon(Icons.image),
                  title: Text(cert.nome),
                  subtitle: Text(cert.descricao),
                );
              },
            ),
    );
  }
}
