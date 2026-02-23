import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(title: Text('Netflix'), backgroundColor: Colors.black),
      body: Center(
        child: Text(
          '넷플릭스 클론 시작',
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
      ),
    );
  }
}
