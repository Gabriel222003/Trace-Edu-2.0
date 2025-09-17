import 'package:flutter/material.dart';
import 'package:trace_edu/Componentes/TricePlaceHolder.dart';

class TriceBottomNavigationBarItem extends StatefulWidget {
  const TriceBottomNavigationBarItem({super.key});

  @override
  _TriceBottomNavigationBarItem createState() => _TriceBottomNavigationBarItem();
}

class _TriceBottomNavigationBarItem extends State<TriceBottomNavigationBarItem> {
  int _selectedIndex = 0;
  late List<Widget> _telas;


  
  

  @override
  void initState() {
    super.initState();
    _telas = [
      const TricePlaceholderScreen(title: 'Faltas'),
      const TricePlaceholderScreen(title: 'Notas'),
      const TricePlaceholderScreen(title: 'Matérias'),
    ];
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _telas[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
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
        currentIndex: _selectedIndex,
        selectedItemColor: const Color.fromARGB(255, 0, 0, 0),
        unselectedItemColor: const Color.fromARGB(179, 135, 134, 134),
        backgroundColor: Colors.blue[900],
        onTap: _onItemTapped,
      ),
    );
  }
}