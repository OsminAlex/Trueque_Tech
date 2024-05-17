// ignore_for_file: use_key_in_widget_constructors
/*
import 'package:trueque_tech/pages/bottom_navigation/global_variable.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trueque_tech/themes/colors.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Obx(() => BottomNavigationBar(
          selectedItemColor: AppColors.sinDefinir04.withOpacity(0.9),
          unselectedItemColor: Colors.black,
          elevation: 10,
          iconSize: 25,
          //backgroundColor: AppColors.sinDefinir04.withOpacity(0.3),
          type: BottomNavigationBarType.fixed,
          currentIndex: GlobalVariable.selectedIndex.value,
          onTap: (index) {
            GlobalVariable.selectedIndex.value = index;
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite_outline),
              label: 'Favorite',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.add_box_outlined),
              label: 'Publish',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.chat_outlined /*forum*/),
              label: 'Chat',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_2_outlined),
              label: 'Profile',
            ),
          ],
        ));
  }
}
*/