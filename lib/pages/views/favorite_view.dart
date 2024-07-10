import 'package:flutter/material.dart';
import 'package:trueque_tech/pages/views/custom_chips.dart';
import 'package:trueque_tech/pages/views/search_viewmodel.dart';
import 'package:trueque_tech/themes/colors.dart';
import 'package:get/get.dart';
import 'package:trueque_tech/utils/strings.dart';
import 'package:trueque_tech/utils/CustomTextButton.dart';

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
                          advanceSearchBtn(context),
                          popularCarListView(),
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
            hintText: AppStrings.searchbarHint,
            contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 10),
            hintStyle: TextStyle(
              color: AppColors.BotonesApp.withOpacity(0.3),
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
            filled: true,
            fillColor: Colors.grey[50],
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(5.0),
            ),
          ),
          style: TextStyle(color: AppColors.BotonesApp),
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
        return SizedBox(
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
                      'Lugares de Venta, Precios, Generacion',
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
              'Busqueda Reciente',
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            Spacer(),
            InkWell(
              onTap: () {},
              child: Row(
                children: [
                  Text(
                    'Ver Todos',
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

  Widget advanceSearchBtn(BuildContext context) {
    return Center(
      child: CustomTextButton(
        key: Key('advanceSearchButton'),
        onPressed: () {
          filterBottomSheet(context);
        },
        textColor: AppColors.BotonesApp,
        fontSize: 13,
        fontWeight: FontWeight.w500,
        text: 'Busqueda Avanzada',
      ),
    );
  }

  Widget popularCarListView() {
    return ListView.separated(
        padding: EdgeInsets.only(bottom: 100),
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return popularCarListViewItem(index);
        },
        separatorBuilder: (context, index) {
          return SizedBox(
            height: 3,
          );
        },
        itemCount: 7);
  }

  Widget popularCarListViewItem(int index) {
    return Material(
      child: InkWell(
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
              Icon(Icons.arrow_forward_ios, size: 13),
            ],
          ),
        ),
      ),
    );
  }

  filterBottomSheet(BuildContext context) {
    showModalBottomSheet(
        context: context,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(45))),
        builder: (context) {
          return Stack(
            alignment: Alignment.topRight,
            children: [
              SingleChildScrollView(
                child: Padding(
                  padding:
                      EdgeInsets.only(left: 16, right: 16, top: 20, bottom: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Text(
                          'Filtro Avanzado',
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 18),
                        ),
                      ),
                      SizedBox(height: 5),
                      filterHeading('Categorias'),
                      filterHeading('Precios'),
                      filterHeading('Modelo'),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.close),
                ),
              )
            ],
          );
        });
  }

  Widget filterHeading(String value) {
    return Container(
        padding: EdgeInsets.only(left: 5, bottom: 5, top: 10),
        alignment: Alignment.topLeft,
        child: Text(
          value,
          style: TextStyle(fontWeight: FontWeight.w600),
        ));
  }

  Widget categoryChip() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5),
      child: Wrap(
          children: viewModel.chipList
              .map((e) => CustomChip(
                    selected: false,
                    label: e,
                    onSelected: (value) {},
                  ))
              .toList()),
    );
  }
}
