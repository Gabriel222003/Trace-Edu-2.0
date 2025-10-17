import 'package:flutter/material.dart';

class TriceTextField extends StatelessWidget {
  final String label;
  final IconData? icon;
  final TextInputType keyboardType;
  final bool obscureText;

  const TriceTextField({
    Key? key,
    required this.label,
    this.icon,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return TextField(
      obscureText: obscureText,
      keyboardType: keyboardType,
      style: TextStyle(color: theme.textTheme.bodyLarge?.color),
      decoration: InputDecoration(
        prefixIcon: icon != null ? Icon(icon, color: theme.primaryColor) : null,
        labelText: label,
        labelStyle: TextStyle(color: theme.primaryColor),
        filled: true,
        fillColor: theme.inputDecorationTheme.fillColor ?? Colors.white,
        border: theme.inputDecorationTheme.border ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.0),
              borderSide: BorderSide(color: theme.primaryColor),
            ),
      ),
    );
  }
}
