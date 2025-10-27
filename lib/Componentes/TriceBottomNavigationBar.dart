import 'package:flutter/material.dart';

class TriceBottomNavigationBar extends StatelessWidget {
  final int numeroTela; // Indica qual tela está selecionada

  const TriceBottomNavigationBar({super.key, required this.numeroTela});

  void _onItemTapped(BuildContext context, int index) {
    const routes = [
      '/telaInicial',
      '/faltas',
      '/notas',
      '/cadastrarMateria',
    ];

    // Só troca se for diferente da rota atual
    if (index != numeroTela) {
      Navigator.pushNamed(context, routes[index]);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: numeroTela,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.white70,
      backgroundColor: Colors.blue[900],
      onTap: (index) => _onItemTapped(context, index),
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Início',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.calendar_today),
          label: 'Faltas',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.book),
          label: 'Notas',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.edit),
          label: 'Matérias',
        ),
      ],
    );
  }
}
