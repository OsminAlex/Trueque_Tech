import 'package:flutter/material.dart';
import 'package:trueque_tech/themes/colors.dart';

void showSnackBar(BuildContext context, String mensaje) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(mensaje),
    duration: const Duration(milliseconds: 5000),
    padding: const EdgeInsets.symmetric(
      horizontal: 3.0, // Inner padding for SnackBar content.
    ),
    behavior: SnackBarBehavior.floating,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(5.0),
    ),
    backgroundColor: AppColors.color3,
    action: SnackBarAction(
      label: "Ok!",
      onPressed: () {},
      textColor: Colors.white,
      backgroundColor: AppColors.BotonesApp,
    ),
  ));
}
