import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Widget child;
  final Color backgroundColor;
  final Color sideColor; // Este es el color del borde lateral

  const CustomElevatedButton({
    Key? key,
    required this.onPressed,
    required this.child,
    this.backgroundColor = Colors.white,
    this.sideColor = Colors.blue, // Color predeterminado para el borde lateral
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        side: BorderSide(
            color: sideColor, width: 0.5), // Aquí se utiliza sideColor
        backgroundColor: backgroundColor,
      ),
      child: child,
    );
  }
}
