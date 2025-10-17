import 'package:flutter/material.dart';

class Menu extends StatelessWidget {
  const Menu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Configurações"),
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: ListView(
        children: [
          ListTile(
            leading: Icon(Icons.notifications),
            title: Text("Notificações"),
            subtitle: Text("Gerenciar preferências de aviso"),
            onTap: () { // alguma coisa aqui
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.accessibility),
            title: Text("Acessibilidade"),
            subtitle: Text("Fonte maior, contraste e mais opções"),
            onTap: () {
              // alguma coisa aqui
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.language),
            title: Text("Idioma"),
            subtitle: Text("Português (Brasil)"),
            onTap: () {
              // alguma coisa aqui
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.info),
            title: Text("Sobre"),
            subtitle: Text("Versão 1.0.0"),
            onTap: () {}, // muda idioma?
          ),
        ],
      ),
    );
  }
}