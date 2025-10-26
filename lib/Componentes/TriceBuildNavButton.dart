import 'package:flutter/material.dart';

class TriceBuildNavButton extends StatelessWidget {
  final  IconData icon;
  final  String label;
  final  VoidCallback onTap;

  const TriceBuildNavButton({
   required this.icon,  
    required this.label, 
    required this.onTap, 
  });
  

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(12.0),
          boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 4.0, offset: Offset(2.0, 2.0))],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 32, color: Theme.of(context).colorScheme.primary),
            const SizedBox(height: 8.0),
            Text(label, style: TextStyle(color: Theme.of(context).colorScheme.primary, fontSize: 16, decoration: TextDecoration.none)),
          ],
        ),
      ),
    );
  }
}