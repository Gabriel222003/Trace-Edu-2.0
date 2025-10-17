import 'package:flutter/material.dart';

class TriceText extends StatelessWidget {
  final String label;
  final double fontSize;
  final FontWeight fontWeight;
  final TextDecoration? decoration;
  final Color? color;
  final String? fontFamily;
  final TextAlign? textAlign;

  const TriceText({ 
    required this.label, 
    required this.fontSize, 
    required this.fontWeight,
    this.decoration,
    this.color,
    this.fontFamily,
    this.textAlign,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      textAlign: textAlign ?? TextAlign.start,
      style: TextStyle(
        color: color?? Colors.white,
        fontSize: fontSize,
        fontWeight: fontWeight,
        decoration: decoration ?? TextDecoration.none,
        decorationColor: Colors.blueAccent,
        fontFamily: fontFamily?? "Roboto",
        
      ),
    );
  }
}
