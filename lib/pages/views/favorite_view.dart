import 'package:flutter/material.dart';
import 'package:trueque_tech/pages/views/search_viewmodel.dart';
import 'package:trueque_tech/themes/colors.dart';
import 'package:get/get.dart';
import 'package:trueque_tech/utils/strings.dart';

class FavoriteView extends StatelessWidget {
  FavoriteView({super.key});

  final SearchViewModel viewModel = Get.put(SearchViewModel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          searchTextField(),
          Obx(
            () => Expanded(
              child: viewModel.searchCheck.value
                  ? searchResultListView()
                  : SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          recentSearches(),
                          recentsearchResultListView(),
                        ],
                      ),
                    ),
            ),
          )
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
          controller: viewModel.searchController,
          onChanged: (value) {
            if (value.isEmpty) {
              viewModel.searchCheck.value = false;
            } else {
              viewModel.searchCheck.value = true;
            }
          },
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

  Widget searchResultListView() {
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
  }

  Widget recentsearchResultListView() {
    return ListView.separated(
      padding: EdgeInsets.zero,
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return recentsearchesListViewItem(index);
      },
      separatorBuilder: (context, index) {
        return Divider(
          height: 3,
        );
      },
      itemCount: 3,
    );
  }

  Widget recentsearchesListViewItem(int index) {
    return Material(
      child: InkWell(
        onTap: () {},
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 15),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'AirPods Pro',
                      style:
                          TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
                    ),
                    Text(
                      'All Cities, All Types, All Prices',
                      style: TextStyle(fontSize: 11, color: AppColors.color3),
                    ),
                  ],
                ),
              ),
              Icon(Icons.arrow_forward_ios, size: 13),
            ],
          ),
        ),
      ),
    );
  }

  Widget searchListViewItem(int index) {
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
  }

  Widget recentSearches() {
    return Container(
        padding: EdgeInsets.fromLTRB(16, 15, 16, 20),
        child: Row(
          children: [
            Text(
              'Recent Search',
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            Spacer(),
            InkWell(
              onTap: () {},
              child: Row(
                children: [
                  Text(
                    'View All',
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: AppColors.BotonesApp,
                        fontSize: 13),
                  ),
                  Icon(Icons.arrow_forward_ios,
                      size: 12, color: AppColors.BotonesApp),
                ],
              ),
            )
          ],
        ));
  }

  /*Widget advanceSearchBtn() {
    return Center(
      child: CustomTextButton(
        width: double.minPositive,
        foregroundColor: AppColors.BotonesApp,
        onPressed: (){},
        child: Text(
          'Advance Search',
          style: TextStyle( 
            col
          ),
        )
      )
    );
  }*/
}
