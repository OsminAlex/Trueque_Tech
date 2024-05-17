import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trueque_tech/pages/views/chat_view.dart';
import 'package:trueque_tech/pages/views/profile_view.dart';

class BottomNavigationViewModel extends GetxController {
  Widget selectView(int index, BuildContext context) {
    switch (index) {
      case 0:
        return Center(child: Text('Home View', style: TextStyle(fontSize: 24)));
      case 1:
        return ChatView();
      case 2:
        return ProfileView();
      default:
        return Center(
            child: Text('Unknown View', style: TextStyle(fontSize: 24)));
    }
  }
}
