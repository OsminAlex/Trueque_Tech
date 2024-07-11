import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final double height;
  final double width;
  final Widget child;
  final double radius;
  final BorderSide? side;

  CustomTextButton(
      {super.key,
      this.onPressed,
      this.backgroundColor,
      this.foregroundColor,
      this.height = 48,
      this.width = double.infinity,
      required this.child,
      this.radius = 10,
      this.side});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: child,
      style: ElevatedButton.styleFrom(
          side: side,
          backgroundColor: backgroundColor,
          foregroundColor: foregroundColor,
          minimumSize: Size(width, height),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius),
          )),
    );
  }
}
