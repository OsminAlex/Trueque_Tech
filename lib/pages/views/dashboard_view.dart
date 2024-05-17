import 'package:flutter/material.dart';

class DashboardView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('DashboardView', style: TextStyle(fontSize: 24)),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
