import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:get/get.dart';
import 'package:trueque_tech/themes/colors.dart';
import 'package:trueque_tech/pages/bottom_navigation/global_variable.dart';

class CustomGNavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Obx(() => GNav(
          selectedIndex: GlobalVariable.selectedIndex.value,
          onTabChange: (index) {
            GlobalVariable.selectedIndex.value = index;
          },
          gap: 8,
          color: Colors.black,
          activeColor: AppColors.sinDefinir04.withOpacity(0.9),
          iconSize: 26,
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          tabBackgroundColor: AppColors.sinDefinir04.withOpacity(0.2),
          tabs: const [
            GButton(
              icon: Icons.home_outlined,
              text: 'Home',
            ),
            GButton(
              icon: Icons.favorite_outline,
              text: 'Favorite',
            ),
            GButton(
              icon: Icons.add_box_outlined,
              text: 'Publish',
            ),
            GButton(
              icon: Icons.chat_outlined,
              text: 'Chat',
            ),
            GButton(
              icon: Icons.person_2_outlined,
              text: 'Profile',
            ),
          ],
        ));
  }
}
