// ignore_for_file: override_on_non_overriding_member

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SearchViewModel extends GetxController {
  RxBool searchCheck = false.obs;
  TextEditingController searchController = TextEditingController();
  List<String> earphoneList = [
    'Airpods Pro',
    'Airpods Max',
    'Airpods 2',
    'Galaxy Buds2 Pro',
    'Galaxy BudsLive',
    'Galaxy Buds+'
  ];

  @override
  void OnClose() {
    searchController.dispose();
    super.onClose();
  }
}
