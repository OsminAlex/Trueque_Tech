import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SearchViewModel extends GetxController {
  RxBool searchCheck = false.obs;
  TextEditingController searchController = TextEditingController();

  @override
  void OnClose() {
    searchController.dispose();
    super.onClose();
  }
}
