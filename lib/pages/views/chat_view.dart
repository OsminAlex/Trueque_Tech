import 'package:flutter/material.dart';

class ChatView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('MessageView', style: TextStyle(fontSize: 24)),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
