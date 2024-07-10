import 'package:flutter/material.dart';
import 'package:trueque_tech/themes/colors.dart';

class CustomChip extends StatelessWidget {
  final String label;
  final bool selected;
  final void Function(bool)? onSelected;
  CustomChip(
      {super.key,
      required this.label,
      required this.selected,
      this.onSelected});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 1),
      child: InputChip(
        label: Text(
          label,
        ),
        labelStyle: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 12,
            color: selected ? Colors.white : Colors.grey),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        showCheckmark: false,
        labelPadding: EdgeInsets.symmetric(horizontal: 10),
        selectedColor: AppColors.BotonesApp,
        backgroundColor: Colors.blueGrey,
        onSelected: onSelected,
        selected: selected,
      ),
    );
  }
}
