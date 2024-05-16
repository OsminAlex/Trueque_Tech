import 'package:flutter/material.dart';
import 'package:trueque_tech/pages/favorite_page.dart';
import 'package:trueque_tech/pages/publish_page.dart';
import 'package:trueque_tech/themes/colors.dart';
import 'package:trueque_tech/pages/profile_page.dart';
import 'package:trueque_tech/pages/chat_page.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class DashBoardPage extends StatefulWidget {
  static const String routename = 'Dashboard';
  const DashBoardPage({Key? key}) : super(key: key);

  @override
  _DashBoardPageState createState() => _DashBoardPageState();
}

class _DashBoardPageState extends State<DashBoardPage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: GNav(
        selectedIndex: _selectedIndex,
        onTabChange: (index) {
          setState(() {
            _selectedIndex = index;
          });
          _navigateToPage(context, index);
        },
        backgroundColor: AppColors.sinDefinir04.withOpacity(0.2),
        iconSize: 25,
        gap: 8,
        haptic: false,
        padding: EdgeInsets.all(18),
        tabs: [
          GButton(
            icon: Icons.home,
            text: 'Home',
          ),
          GButton(
            icon: Icons.favorite,
            text: 'Favorite',
          ),
          GButton(
            icon: Icons.add_box_outlined,
            text: 'Publish',
          ),
          GButton(
            icon: Icons.forum,
            text: 'Chat',
          ),
          GButton(
            icon: Icons.person,
            text: 'Profile',
          ),
        ],
      ),
    );
  }

  void _navigateToPage(BuildContext context, int index) {
    switch (index) {
      /*case 1:
        Navigator.pushNamed(context, FavoritePage.routename);
        break;
      case 2:
        Navigator.pushNamed(context, PublishPage.routename);
        break;
      case 3:
        Navigator.pushNamed(context, ChatPage.routename);
        break;*/
      case 4:
        Navigator.pushNamed(context, ProfilePage.routename);
        break;
    }
  }
}
