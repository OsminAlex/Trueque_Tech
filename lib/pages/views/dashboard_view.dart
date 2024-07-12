import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trueque_tech/pages/views/notification_view.dart';
import 'package:trueque_tech/themes/colors.dart';
import 'package:trueque_tech/utils/CustomTextButton1.dart'; // Asegúrate de que la ruta sea correcta
import 'package:trueque_tech/utils/strings.dart';

class DashboardView extends StatelessWidget {
  DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            searchTextField(),
            headingItem('Busquedas Recientes'),
            recentSearchesListView(),
            headingItem('Buscar Productos'),
            tabs(),
            latestNewsHeading(),
            latestNewsListView()
          ],
        ),
      ),
    );
  }

  Widget latestNewsHeading() {
    return Padding(
      padding: EdgeInsets.only(right: 16, bottom: 10),
      child: Row(
        children: [
          headingItem('Ultimas Publicaciones'),
          Spacer(),
          Text(
            'Ver Todo',
            style: (TextStyle(
                color: AppColors.BotonesApp,
                fontSize: 12,
                fontWeight: FontWeight.w500)),
          ),
          Icon(
            Icons.arrow_forward_ios,
            size: 10,
            color: AppColors.BotonesApp,
          )
        ],
      ),
    );
  }

  AppBar appBar() {
    return AppBar(
      primary: false,
      backgroundColor: Colors.white,
      automaticallyImplyLeading: false,
      titleSpacing: 0,
      leadingWidth: 0,
      title: Padding(
        padding: EdgeInsets.only(left: 10),
        child: Row(
          children: [
            CustomTextButton(
              radius: 6,
              height: 8,
              width: double.minPositive,
              backgroundColor: AppColors.BotonesApp,
              foregroundColor: Colors.white,
              onPressed: () {},
              child: Text(
                'Producto Usado',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            SizedBox(width: 12),
            CustomTextButton(
              radius: 6,
              height: 8,
              width: double.minPositive,
              backgroundColor: Color.fromARGB(235, 182, 182, 173),
              foregroundColor: Colors.black,
              onPressed: () {},
              child: Text(
                'Producto Nuevo',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {
            Get.to(() => NotificationView());
          },
          icon: Icon(Icons.notifications_rounded,
              color: AppColors.BotonesApp, size: 28),
        ),
      ],
    );
  }

  Widget searchTextField() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 14),
      child: SizedBox(
        height: 48,
        child: Stack(
          alignment: Alignment.centerRight,
          children: [
            TextFormField(
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.search_rounded,
                  color: AppColors.BotonesApp,
                ),
                hintText: AppStrings.searchbarHint,
                contentPadding:
                    EdgeInsets.symmetric(vertical: 12, horizontal: 10),
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
            IconButton(
              icon: Icon(
                Icons.tune_rounded,
                color: AppColors.BotonesApp,
              ),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }

  Widget headingItem(String value) {
    return Padding(
      padding: EdgeInsets.only(left: 16, top: 10),
      child: Text(
        value,
        style: TextStyle(fontWeight: FontWeight.w600),
      ),
    );
  }

  Widget recentSearchesListView() {
    return SizedBox(
      height: Get.height * 0.16,
      child: ListView.builder(
          padding: EdgeInsets.only(left: 16),
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: 6,
          itemBuilder: (context, index) {
            return recentSearchesListViewItem(index);
          }),
    );
  }

  Widget recentSearchesListViewItem(int index) {
    return Padding(
      padding: EdgeInsets.only(right: 10, bottom: 10, top: 10),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: () {},
          child: Ink(
            width: Get.width * 0.5,
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.white,
                border: Border.all(color: Colors.grey.shade100),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.shade50,
                      spreadRadius: 1,
                      offset: Offset(1, 1),
                      blurRadius: 3)
                ]),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'HP NOTEBOOK',
                  style: TextStyle(fontSize: 13),
                ),
                SizedBox(height: 5),
                Text(
                  'Managua, Cualquier Precio,Cualquier Modelo',
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(color: Colors.grey.shade400, fontSize: 10.5),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget tabs() {
    return Container(
      padding: EdgeInsets.only(top: 10),
      height: Get.height * 0.25,
      child: DefaultTabController(
        length: 4,
        child: Column(
          children: [
            TabBar(
              isScrollable: false,
              padding: EdgeInsets.zero,
              physics: NeverScrollableScrollPhysics(),
              labelPadding: EdgeInsets.zero,
              labelColor: AppColors.BotonesApp,
              unselectedLabelColor: Color.fromARGB(235, 104, 104, 99),
              labelStyle: TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
              tabs: [
                Tab(
                  height: 30,
                  text: 'Categorias',
                ),
                Tab(
                  height: 30,
                  text: 'Marca',
                ),
                Tab(
                  height: 30,
                  text: 'Modelo',
                ),
                Tab(
                  height: 30,
                  text: 'Ciudad',
                ),
              ],
            ),
            Expanded(
                child: TabBarView(
              physics: NeverScrollableScrollPhysics(),
              children: [
                categoriesGridView(),
                BrandGridView(),
                ModelGridView(),
                CityGridView(),
              ],
            ))
          ],
        ),
      ),
    );
  }

  Widget categoriesGridView() {
    return GridView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        padding: EdgeInsets.all(10),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1,
            crossAxisSpacing: 10,
            mainAxisSpacing: 15),
        itemBuilder: (context, index) {
          return categoriesGridViewItem(index);
        });
  }

  Widget BrandGridView() {
    return GridView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        padding: EdgeInsets.all(10),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1,
            crossAxisSpacing: 10,
            mainAxisSpacing: 15),
        itemBuilder: (context, index) {
          return BrandGridViewItem(index);
        });
  }

  Widget ModelGridView() {
    return GridView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        padding: EdgeInsets.all(10),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1,
            crossAxisSpacing: 10,
            mainAxisSpacing: 15),
        itemBuilder: (context, index) {
          return ModelGridViewItem(index);
        });
  }

  Widget CityGridView() {
    return GridView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        padding: EdgeInsets.all(10),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1,
            crossAxisSpacing: 10,
            mainAxisSpacing: 15),
        itemBuilder: (context, index) {
          return CityGridViewItem(index);
        });
  }

  Widget categoriesGridViewItem(int index) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 1,
                blurRadius: 2,
                offset: Offset(0, 1)),
          ]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/computer1.png',
            width: 26,
            height: 26,
            color: Colors.black,
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            'Computadoras',
            style: TextStyle(
                color: AppColors.BotonesApp.withOpacity(0.5),
                fontWeight: FontWeight.w500,
                fontSize: 8),
          )
        ],
      ),
    );
  }

  Widget BrandGridViewItem(int index) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 1,
                blurRadius: 2,
                offset: Offset(0, 1)),
          ]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/acer.jpg',
            width: 26,
            height: 26,
            color: Colors.black,
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            'Acer',
            style: TextStyle(
                color: AppColors.BotonesApp.withOpacity(0.5),
                fontWeight: FontWeight.w500,
                fontSize: 8),
          )
        ],
      ),
    );
  }

  Widget ModelGridViewItem(int index) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 1,
                blurRadius: 2,
                offset: Offset(0, 1)),
          ]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/chromebook.png',
            width: 26,
            height: 26,
            color: Colors.black,
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            'NoteBook',
            style: TextStyle(
                color: AppColors.BotonesApp.withOpacity(0.5),
                fontWeight: FontWeight.w500,
                fontSize: 8),
          )
        ],
      ),
    );
  }

  Widget CityGridViewItem(int index) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 1,
                blurRadius: 2,
                offset: Offset(0, 1)),
          ]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/ciudad.png',
            width: 26,
            height: 26,
            color: Colors.black,
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            'Managua',
            style: TextStyle(
                color: AppColors.BotonesApp.withOpacity(0.5),
                fontWeight: FontWeight.w500,
                fontSize: 8),
          )
        ],
      ),
    );
  }

  Widget latestNewsListView() {
    return ListView.separated(
        physics: NeverScrollableScrollPhysics(),
        padding: EdgeInsets.only(left: 16, right: 16, bottom: 80),
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return latestNewsListViewItem();
        },
        separatorBuilder: (context, index) {
          return Divider(
            thickness: 0.3,
            color: Colors.blueGrey,
          );
        },
        itemCount: 5);
  }

  Widget latestNewsListViewItem() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          height: 60,
          width: 60,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            image: DecorationImage(
                image: AssetImage('assets/lap.jpg'), fit: BoxFit.cover),
          ),
        ),
        SizedBox(width: 10),
        Expanded(
            child: Column(
          children: [
            Text(
              'Computadora Portatil Con Windows 11',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: 10, fontWeight: FontWeight.w600),
            ),
            Text(
              '15.6 Pulgadas, Grafica Integrada',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  fontSize: 8, fontWeight: FontWeight.w600, color: Colors.grey),
            ),
            Row(
              children: [
                Text(
                  'Hace 17 Horas',
                  style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.w500,
                      fontSize: 8),
                ),
                Spacer(),
                Text(
                  '19',
                  style: TextStyle(color: Colors.grey, fontSize: 8),
                ),
                SizedBox(width: 2),
                Icon(Icons.comment, color: Colors.grey, size: 9)
              ],
            )
          ],
        ))
      ],
    );
  }
}
