import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color textColor;
  final double fontSize;
  final FontWeight fontWeight;
  final Key? key; // Ahora key es opcional y puede ser null

  const CustomTextButton({
    required this.text,
    required this.onPressed,
    this.textColor = Colors.blue,
    this.fontSize = 16.0,
    this.fontWeight = FontWeight.normal,
    this.key, // Acepta key como un parámetro opcional
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      key: key, // Usa key si está definido, de lo contrario será null
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(
          color: textColor,
          fontSize: fontSize,
          fontWeight: fontWeight,
        ),
      ),
    );
  }
}
