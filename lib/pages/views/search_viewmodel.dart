// ignore_for_file: override_on_non_overriding_member

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SearchViewModel extends GetxController {
  RxBool searchCheck = false.obs;
  TextEditingController searchController = TextEditingController();
  List<String> chipList = [
    'Ropa',
    'Electronica',
    'Computo',
    'Vehiculos',
    'Herramientas',
  ];
  List<String> chipList1 = [
    'Tamaño',
    'Año',
    'Estilos',
    'Version',
    'Colores',
  ];

  @override
  void OnClose() {
    searchController.dispose();
    super.onClose();
  }
}
