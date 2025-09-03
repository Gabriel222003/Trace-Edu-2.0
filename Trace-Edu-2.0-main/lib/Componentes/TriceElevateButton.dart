import 'package:flutter/material.dart';

class TriceElevateButton extends StatelessWidget {
  final Function()? funcaoBotao;
  final double elevacao;
  final Widget? widgetText;

  const TriceElevateButton({
    Key? key,
    required this.funcaoBotao,
    required this.elevacao,
    required this.widgetText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: funcaoBotao,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        elevation: 5,
      ),
      child: widgetText,
    );
  }
}
