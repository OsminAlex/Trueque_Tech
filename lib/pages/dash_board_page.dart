import 'package:flutter/material.dart';

class DashBoardPage extends StatelessWidget {
  static const String routename = 'DashBoard';
  const DashBoardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Material App Bar'),
        ),
        body: const Center(
          child: Text('Hello World'),
        ),
      ),
    );
  }
}
