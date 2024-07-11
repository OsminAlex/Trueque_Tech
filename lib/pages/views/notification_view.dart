import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trueque_tech/themes/colors.dart';
import 'package:trueque_tech/utils/CustomTextButton1.dart';

class NotificationView extends StatelessWidget {
  const NotificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBar(),
      body: ListView.separated(
          padding: EdgeInsets.symmetric(horizontal: 16),
          itemBuilder: ((context, index) {
            return ListViewItem(index);
          }),
          separatorBuilder: ((context, index) {
            return SizedBox(height: 12);
          }),
          itemCount: 5),
    );
  }

  PreferredSizeWidget appBar() {
    return AppBar(
      backgroundColor: Colors.white,
      leading: IconButton(
        onPressed: () {
          Get.back();
        },
        icon: Icon(CupertinoIcons.chevron_back),
      ),
      titleSpacing: -10,
      title: Text(''),
      actions: [
        Padding(
          padding: EdgeInsets.only(top: 5, bottom: 5, right: 6),
          child: CustomTextButton(
            width: double.minPositive,
            radius: 6,
            foregroundColor: Colors.black,
            onPressed: () {},
            child: Text(
              'Borrar Todo',
              style: TextStyle(
                fontSize: 13,
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget ListViewItem(int index) {
    return Dismissible(
      direction: DismissDirection.endToStart,
      key: UniqueKey(),
      child: Material(
        color: Colors.grey.withOpacity(0.1),
        child: InkWell(
          onTap: () {},
          borderRadius: BorderRadius.circular(14),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 9),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
            ),
            child: Row(
              children: [
                Container(
                  width: 65,
                  height: 65,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    image: DecorationImage(
                        image: AssetImage('assets/profile.jpg'),
                        fit: BoxFit.fill),
                  ),
                ),
                SizedBox(width: 12),
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Esto es la descripcion de notificaciones',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 12),
                    ),
                    SizedBox(height: 3.5),
                    Text(
                      'Hace 16 Minutos',
                      style: TextStyle(fontSize: 11.5),
                    )
                  ],
                ))
              ],
            ),
          ),
        ),
      ),
      background: Align(
        alignment: Alignment.centerRight,
        child: Container(
          margin: EdgeInsets.only(right: 3),
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.grey),
          child: Icon(CupertinoIcons.delete, color: Colors.red, size: 16),
        ),
      ),
    );
  }
}
