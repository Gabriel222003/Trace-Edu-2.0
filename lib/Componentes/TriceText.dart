import 'package:flutter/material.dart';

class TriceText extends StatelessWidget {
  final String label;
  final double fontSize;
  final FontWeight fontWeight;
  final TextDecoration? decoration;

  const TriceText({Key? key, 
    required this.label, 
    required this.fontSize, 
    required this.fontWeight,
    this.decoration,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      this.label,
      style: TextStyle(
        color: Colors.white,
        fontSize: this.fontSize,
        fontWeight: this.fontWeight,
        decoration: decoration,
        decorationColor: Colors.blueAccent,
      ),
    );
  }
}
