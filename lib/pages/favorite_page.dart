import 'package:flutter/material.dart';
import 'package:trueque_tech/themes/colors.dart';

class FavoritePage extends StatelessWidget {
  static const String routename = 'Favorite';
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.clear,
              size: 100,
              color: AppColors.sinDefinir04,
            ),
            SizedBox(height: 20),
            Text(
              'Página en construcción Favorite',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
