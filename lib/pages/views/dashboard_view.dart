import 'package:flutter/material.dart';
import 'package:trueque_tech/themes/colors.dart';
import 'package:trueque_tech/utils/CustomTextButton.dart';
import 'package:trueque_tech/utils/strings.dart';

class DashboardView extends StatelessWidget {
  DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          searchTextField(),
        ],
      ),
    );
  }

  AppBar appBar() {
    return AppBar(
      primary: false,
      backgroundColor: Colors.white,
      automaticallyImplyLeading: false,
      titleSpacing: 0,
      leadingWidth: 0,
      title: Padding(
        padding: EdgeInsets.only(left: 10),
        child: Row(
          children: [
            CustomTextButton(
              child: Text(
                'Producto Usado',
                style: TextStyle(),
              ),
              onPressed: () {
                // Acción al presionar el botón 'Producto Usado'
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget searchTextField() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: SizedBox(
        height: 48,
        child: TextFormField(
          decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.search_rounded,
              color: AppColors.BotonesApp,
            ),
            hintText: AppStrings.searchbarHint,
            contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 10),
            hintStyle: TextStyle(
              color: AppColors.BotonesApp.withOpacity(0.3),
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
            filled: true,
            fillColor: Colors.grey[50],
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(5.0),
            ),
          ),
          style: TextStyle(color: AppColors.BotonesApp),
        ),
      ),
    );
  }
}
