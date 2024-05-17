import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trueque_tech/pages/bottom_navigation/bottom_navigation_viewmodel.dart';
import 'bottom_navigation/custom_bottom_navigation_bar.dart';
import 'bottom_navigation/global_variable.dart';

class DashboardPage extends StatelessWidget {
  DashboardPage({Key? key}) : super(key: key);
  final BottomNavigationViewModel viewModel =
      Get.put(BottomNavigationViewModel());

  static const String routename = 'Dashboard';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        extendBody: true,
        body: Obx(
          () =>
              viewModel.selectView(GlobalVariable.selectedIndex.value, context),
        ),
        bottomNavigationBar: CustomBottomNavigationBar(),
      ),
    );
  }
}
