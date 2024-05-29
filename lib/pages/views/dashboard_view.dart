import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:trueque_tech/themes/colors.dart';
import 'package:trueque_tech/utils/strings.dart';

class DashboardView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return Scaffold(
            backgroundColor: Colors.white,
            body: Padding(
              padding: EdgeInsets.symmetric(vertical: 3.h, horizontal: 1.5.h),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Text(
                  //   "Hola, bienvenido",
                  //   style: TextStyle(
                  //       color: AppColors.BotonesApp,
                  //       fontSize: 12.sp,
                  //       fontWeight: FontWeight.bold),
                  // ),
                  // SizedBox(
                  //   height: 5.h,
                  // ),
                  TextField(
                    style: TextStyle(color: AppColors.BotonesApp),
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.grey[50],
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                          borderSide: BorderSide.none,
                        ),
                        hintText: AppStrings.searchbarHint,
                        hintStyle: TextStyle(
                            //fontSize: 12.sp,
                            color: AppColors.BotonesApp.withOpacity(0.3)),
                        prefixIcon: Icon(Icons.search),
                        prefixIconColor: AppColors.BotonesApp),
                  ),
                ],
              ),
            ));
      },
    );
  }
}
