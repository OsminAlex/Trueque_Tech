import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trueque_tech/pages/views/chat_view.dart';
import 'package:trueque_tech/pages/views/dashboard_view.dart';
import 'package:trueque_tech/pages/views/profile_view.dart';
import 'package:trueque_tech/pages/views/favorite_view.dart';
import 'package:trueque_tech/pages/views/publish_view.dart';

class BottomNavigationViewModel extends GetxController {
  Widget selectView(int index, BuildContext context) {
    switch (index) {
      case 0:
        return DashboardView();
      case 1:
        return FavoriteView();
      case 2:
        return PublishView();
      case 3:
        return ChatView();
      case 4:
        return ProfileView();
      default:
        return Center(
            child: Text('Unknown View', style: TextStyle(fontSize: 24)));
    }
  }
}
