import 'package:flutter/material.dart';
import 'package:trueque_tech/pages/views/custom_chips.dart';
import 'package:trueque_tech/pages/views/search_viewmodel.dart';
import 'package:trueque_tech/themes/colors.dart';
import 'package:get/get.dart';
import 'package:trueque_tech/utils/custom_elevated_button.dart';
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
        child: Container(
          color: Color.fromRGBO(235, 235, 235, 1),
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
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        'Lugares de Venta, Precios, Generacion',
                        style: TextStyle(
                          fontSize: 11,
                          color: AppColors.color3,
                        ),
                      ),
                    ],
                  ),
                ),
                Icon(Icons.arrow_forward_ios, size: 13),
              ],
            ),
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
        itemCount: 10);
  }

  Widget popularCarListViewItem(int index) {
    return Material(
      child: InkWell(
        onTap: () {},
        child: Container(
          color: Color.fromRGBO(235, 235, 235, 1),
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
                      categoryChip(),
                      filterHeading('Precios'),
                      priceSlider(),
                      filterHeading('Modelo del Producto'),
                      categoryChip1(),
                      filterButtons()
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

  Widget categoryChip1() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5),
      child: Wrap(
          children: viewModel.chipList1
              .map((e) => CustomChip(
                    selected: false,
                    label: e,
                    onSelected: (value) {},
                  ))
              .toList()),
    );
  }

  Widget priceSlider() {
    return Padding(
      padding: EdgeInsets.only(left: 5, bottom: 25, top: 16, right: 5),
      child: SliderTheme(
        data: SliderThemeData(
          showValueIndicator: ShowValueIndicator.always,
          trackHeight: 1.5,
        ),
        child: RangeSlider(
          labels: RangeLabels(
            "1200",
            "1500",
          ),
          min: 0.0,
          max: 100.0,
          activeColor: AppColors.BotonesApp,
          inactiveColor: Colors.grey,
          values: RangeValues(20, 80),
          onChanged: (value) {},
        ),
      ),
    );
  }

  Widget filterButtons() {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: CustomElevatedButton(
            onPressed: () {},
            sideColor:
                AppColors.BotonesApp, // Define el color del borde lateral aquí
            backgroundColor: Colors.white,
            child: Text(
              'Borrar',
              style: TextStyle(
                fontSize: 16,
                color: AppColors.BotonesApp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
        SizedBox(width: 15),
        Expanded(
          flex: 2,
          child: CustomElevatedButton(
            onPressed: () {},
            backgroundColor: AppColors.BotonesApp,
            child: Text(
              'Aplicar Filtro',
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
