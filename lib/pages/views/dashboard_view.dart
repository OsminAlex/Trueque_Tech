import 'package:flutter/material.dart';
import 'package:trueque_tech/themes/colors.dart';
import 'package:get/get.dart';
import 'package:trueque_tech/utils/strings.dart';

class DashboardView extends StatelessWidget {
  DashboardView({super.key});

  //final SearchViewModel viewModel = Get.put(SearchViewModel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          searchTextField(),
          /*Obx(
            () => Expanded(
              child: viewModel.searchCheck.value
                  ? searchResultListView()
                  : SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [],
                      ),
                    ),
            ),
          )*/
        ],
      ),
    );
  }

  Widget searchTextField() {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: 16, vertical: 12), // Ajustamos el padding vertical
      child: SizedBox(
        height: 48, // Establecemos la altura deseada
        child: TextFormField(
          //controller: viewModel.searchController,
          /*onChanged: (value) {
            if (value.isEmpty) {
              viewModel.searchCheck.value = false;
            } else {
              viewModel.searchCheck.value = true;
            }
          },*/
          decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.search_rounded,
              color: AppColors.BotonesApp,
            ),
            hintText:
                AppStrings.searchbarHint, // Usamos AppStrings.searchbarHint
            contentPadding: EdgeInsets.symmetric(
                vertical: 12, horizontal: 10), // Ajustamos el padding
            hintStyle: TextStyle(
              color: AppColors.BotonesApp.withOpacity(0.3),
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
            filled: true,
            fillColor: Colors.grey[50],
            border: OutlineInputBorder(
              borderSide: BorderSide.none, // Quitamos el borde
              borderRadius:
                  BorderRadius.circular(5.0), // Ajustamos el radio del borde
            ),
          ),
          style: TextStyle(
              color: AppColors.BotonesApp), // Ajustamos el color del texto
        ),
      ),
    );
  }

  /*Widget searchResultListView() {
    return ListView.separated(
      padding: EdgeInsets.only(bottom: 100, top: 10),
      itemBuilder: (context, index) {
        return searchListViewItem(index);
      },
      separatorBuilder: (context, index) {
        return Divider(
          height: 0,
          color: Colors.grey.shade200,
        );
      },
      itemCount: 10,
    );
  }*/

  /*Widget searchListViewItem(int index) {
    return InkWell(
      onTap: () {},
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 15),
        child: Row(
          children: [
            Expanded(
              child: Text(
                'AirPods Pro',
                style: TextStyle(color: Colors.grey, fontSize: 11.5),
              ),
            ),
            Icon(Icons.arrow_forward_ios, size: 9),
          ],
        ),
      ),
    );
  }*/
}
