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
                  SizedBox(
                    height: 3.h,
                  ),
                  Text(
                    AppStrings.dashboardNews,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 3.h,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.all(10),
                          height: 100,
                          width: 300,
                          padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                              color: Colors.deepPurple.shade400,
                              borderRadius: BorderRadius.circular(10)),
                          child: Center(
                            child: Text("Subs"),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ));
      },
    );
  }
}
